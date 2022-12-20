import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/Welcome/welcome_screen.dart';
import '../Screens/Index/index_screen.dart';
class MainConnect{
  final inforUser;
  final jsonData;
  final collectionData;
  final documentData;
  MainConnect({this.inforUser,this.jsonData,this.collectionData,this.documentData});
  // 'timestamp': FieldValue.serverTimestamp()
  // check login
  void checkAuth(BuildContext context,Widget data){
    final user = FirebaseAuth.instance.currentUser;
    if(user == null){
      Navigator.pop(context);
    }
    else{
      data;
    }
  }
  // login
  Future<void> signInEmail(String email,String password,BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IndexCustom()
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
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WelcomeScreen()
      ),
    );
  }
  // get id user
  String getIdUser() {
    final user = FirebaseAuth.instance.currentUser;
    if(user == null){
      debugPrint("User not found");
      return "";
    }
    else{
      return user.uid;
    }
  }
  // get user
  static Future<dynamic> getUser()async{
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final data={"name":user.displayName,"email":user.email,"photoUrl":user.photoURL,"emailVerified":user.emailVerified,'uid':user.uid,};
      return data;
    }
    else{
      return false;
    }
  }
  // set user
  //update user
  // delete user
  // get data
  // mainConnect.setDataFromFirebase('user',{"sdddd": "Ls Angeles","state": "CA","dddd": "dsdcxcxcxcxs"});
  static Future<List<dynamic>> getDataFromFirebase(final collectionData) async{
    List docs=[];
    await FirebaseFirestore.instance.collection(collectionData).get()
        .then((event) {
            for (var doc in event.docs) {
              docs.add(doc.data());
              // debugPrint("${doc.id} => ${doc.data()}");
              // doc.data().forEach((key, value) {debugPrint("$key:$value");});
            }
            debugPrint("${docs.runtimeType}");
            return docs;
          })
        .catchError((error){
         debugPrint(error);
        });
    return docs;
  }
  // set data
  static Future<dynamic> setDataFromFirebase(final collectionData, final jsonData) async {
    await FirebaseFirestore.instance
        .collection(collectionData)
        .add(jsonData)
        .then((value){debugPrint('them thanh cong');})
        .catchError((e){debugPrint('them that bai');});
  }
  // update data
  static Future<dynamic> updateDataFromFirebase(final collectionData,final documentData, final jsonData) async {
    await FirebaseFirestore.instance
        .collection(collectionData)
        .doc(documentData)
        .update(jsonData)
        .then((value){debugPrint('cap nhat thanh cong');})
        .catchError((e){debugPrint('cap nhat that bai');});
  }
  // delete data
  static Future<dynamic> deleteDataFromFirebase(final collectionData,final documentData) async {
    await FirebaseFirestore.instance
        .collection(collectionData)
        .doc(documentData)
        .delete()
        .then((value){debugPrint('xoa thanh cong');})
        .catchError((e){debugPrint('xoa that bai');});
  }
}