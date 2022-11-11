import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/Index/index_screen.dart';
import '../Screens/Welcome/welcome_screen.dart';
class MainConnect{
  final inforUser;
  final jsonData;
  final collectionData;
  final documentData;
  MainConnect({this.inforUser,this.jsonData,this.collectionData,this.documentData});

  // login
  Future<void> signInEmail(String email,String password,BuildContext context) async {
    try {
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Index()
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }
  //logout
  Future<void> logoutFirebase(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    debugPrint('logged out access to Firebase');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WelcomeScreen()
      ),
    );
  }
  // get user
  // set user
  //update user
  // delete user
  // get data
  // mainConnect.setDataFromFirebase('user',{"sdddd": "Ls Angeles","state": "CA","dddd": "dsdcxcxcxcxs"});
  Future<dynamic> getDataFromFirebase(final collectionData) async{
    await FirebaseFirestore.instance.collection(collectionData).get()
        .then((event) {
            for (var doc in event.docs) {
              debugPrint("${doc.id} => ${doc.data()}");
              // doc.data().forEach((key, value) {debugPrint("$key:$value");});
            }
            return event;
          })
        .catchError((error){
         debugPrint(error);
        });
  }
  // set data
  Future<dynamic> setDataFromFirebase(final collectionData, final jsonData) async {
    await FirebaseFirestore.instance
        .collection(collectionData)
        .add(jsonData)
        .then((value){debugPrint('them thanh cong');})
        .catchError((e){debugPrint('them that bai');});
  }
  // update data
  Future<dynamic> updateDataFromFirebase(final collectionData,final documentData, final jsonData) async {
    await FirebaseFirestore.instance
        .collection(collectionData)
        .doc(documentData)
        .update(jsonData)
        .then((value){debugPrint('cap nhat thanh cong');})
        .catchError((e){debugPrint('cap nhat that bai');});
  }
  // delete data
  Future<dynamic> deleteDataFromFirebase(final collectionData,final documentData) async {
    await FirebaseFirestore.instance
        .collection(collectionData)
        .doc(documentData)
        .delete()
        .then((value){debugPrint('xoa thanh cong');})
        .catchError((e){debugPrint('xoa that bai');});
  }
}