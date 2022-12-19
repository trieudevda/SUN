import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Model/main_connect_firebase.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final email = TextEditingController();
  final password = TextEditingController();
  final mainConnect = MainConnect();
  bool check=true;
  bool regexEmail() {
    bool emailValid =
        RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email.text);
    return emailValid ? true : false;
  }
  bool checkLength() {
    return password.text.length < 8 ? false : true;
  }
  void showPass(){
    if(check){
      check=false;
    }
    else{
      check=true;
    }
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<dynamic> showDialogCustom(BuildContext context,String content) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            child: Row(
              children:const [
                FaIcon(FontAwesomeIcons.exclamation,color: Colors.blue,),
                SizedBox(width: 10,),
                Text("Thông báo",style: TextStyle(fontSize: 25,color: Colors.blue),)
              ],
            ),
          ),
          content: Text(content),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: password,
              textInputAction: TextInputAction.done,
              obscureText: check?true:false,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Mật khẩu",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                      onPressed: (){
                        showPass();
                      },
                      icon: Icon(check?Icons.lock:Icons.lock_open),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
              onPressed: () {
                if (regexEmail() && checkLength() ) {
                  mainConnect.signInEmail(email.text, password.text, context);
                } else {
                  showDialogCustom(context,'Xin vui lòng kiểm tra lại email và mật khẩu');
                }
              },
              child: Text(
                "Đăng Nhập".toUpperCase(),
              ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}