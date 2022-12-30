import 'package:do_an/Screens/Index/index_screen.dart';
import 'package:do_an/Screens/Welcome/welcome_screen.dart';
import 'package:do_an/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';

bool checkAuth=false;
// Future<void> update(User? user)async{
//   await user?.updateDisplayName("Jane Q. User");
//   await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
// }
void main()async {
  WidgetsFlutterBinding.ensureInitialized ();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (FirebaseAuth.instance.currentUser != null) {
  print('user id: ${FirebaseAuth.instance.currentUser?.uid}');
}
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      checkAuth=false;
      debugPrint('Chưa đăng nhập!');
    } else {
      // set infor user
      // update(user);
      // get infor user
      // final name = user.displayName;
      // final email = user.email;
      // final photoUrl = user.photoURL;
      // final emailVerified = user.emailVerified;
      // final uid = user.uid;
      checkAuth=true;
      // debugPrint('Đã đăng nhập!, $name,$email,$photoUrl,$emailVerified,$uid');
    }
  });
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Đồ Án',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(30),
              ),
              borderSide: BorderSide.none,
            ),
          ),
      ),
      home: checkAuth?const IndexCustom():const WelcomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
