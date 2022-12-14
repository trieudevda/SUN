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
  Widget _minute(){
    return TweenAnimationBuilder<Duration>(
      duration: const Duration(seconds: 10),
      tween: Tween(begin: const Duration(seconds: 10), end: Duration.zero),
      onEnd: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>const WelcomeScreen()
          ),
        );
      },
      builder: (BuildContext context, Duration value, Widget? child) {
        final seconds = value.inSeconds % 60;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text('(${seconds}s)',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
  void signup(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:const Text('Ch??c M???ng'),
            content: Row(
              children: [
                const Text('????ng k?? t??i kho???n th??nh c??ng, ??ang chuy???n v??o trang ????ng nh???p!'),
                _minute(),
              ],
            ),
          );
        },
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('M???t kh???u ???????c cung c???p qu?? y???u.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('T??i kho???n ???? t???n t???i.');
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
                  Text("Th??ng b??o",style: TextStyle(fontSize: 25,color: Colors.blue),)
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
                hintText: "M???t kh???u",
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
                hintText: "Nh???p l???i m???t kh???u",
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
                showDialogCustom(context,'Xin vui l??ng ki???m tra l???i email v?? m???t kh???u');
              }
            },
            child: Text("????ng K??".toUpperCase()),
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


