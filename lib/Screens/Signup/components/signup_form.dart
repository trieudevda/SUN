import 'package:do_an/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final email=TextEditingController();
  final password=TextEditingController();
  final rePassword=TextEditingController();
  bool checkpass=true;
  void checkPass(){
    if(checkpass==true){
      checkpass=false;
    }
    else{
      checkpass=true;
    }
    setState(() {});
  }
  bool regexEmail() {
    bool emailValid =
    RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email.text);
    return emailValid ? true : false;
  }
  bool checkLength(){
    return password.text.length<8 ? false : true;
  }
  void signup(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>const WelcomeScreen()
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('Mật khẩu được cung cấp quá yếu.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('Tài khoản đã tồn tại.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
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
              obscureText: checkpass?true:false,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Mật khẩu",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: (){
                      checkPass();
                    },
                    icon: Icon(checkpass?Icons.lock:Icons.lock_open),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: TextFormField(
              controller: rePassword,
              textInputAction: TextInputAction.done,
              obscureText: checkpass?true:false,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Nhập lại mật khẩu",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: (){
                      checkPass();
                    },
                    icon: Icon(checkpass?Icons.lock:Icons.lock_open),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if ( password.text==rePassword.text && regexEmail() && checkLength() ) {
                signup(context);
              } else {
                showDialogCustom(context,'Xin vui lòng kiểm tra lại email và mật khẩu');
              }
            },
            child: Text("Đăng Ký".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
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


