import 'dart:convert';

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
  static Future<Object?> getUser()async{
    final user = FirebaseAuth.instance.currentUser;
    String? name= user?.displayName;
    String? email= user?.email;
    String? photoUrl= user?.photoURL;
    bool? emailVerified= user?.emailVerified;
    String? uid= user?.uid;

   final data={"name":name,"email":email,"photoUrl":photoUrl,"emailVerified":emailVerified,'uid':uid,};
    return data;
  }
  // set user
  static Future<dynamic> signup(BuildContext context,String email,String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
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
  //update user
  static Future<void> update(User? user)async{
    await user?.updateDisplayName("Jane Q. User");
    await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
  }
  // delete user
  // get data
  // mainConnect.setDataFromFirebase('user',{"sdddd": "Ls Angeles","state": "CA","dddd": "dsdcxcxcxcxs"});
  static Future<List<Map<String,dynamic>>> getDataFromFirebase(String collectionData,String doc) async{
    List<Map<String,dynamic>> docs=[];
    //
    if(doc==''){
      await FirebaseFirestore.instance.collection(collectionData).get()
          .then((event) {
        for (var doc in event.docs) {
          // doc.data().forEach((key, value) {
          //   // debugPrint("$key:$value");
          // });
          docs.add(doc.data());
        }
        // debugPrint("docs he: ${docs}");
        return docs;
      })
          .catchError((error){
        debugPrint('error'+error);
      });
    }
    else{
      await FirebaseFirestore.instance.collection(collectionData).doc(doc).get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          //   if(documentSnapshot.data()!=null) {
          //     documentSnapshot?.data().entries?.forEach((e)=>{});
          // }
          print('Document data: ${documentSnapshot.data()}');
          return documentSnapshot.data();
        } else {
          print('Document does not exist on the database');
        }
      });
    }
    // debugPrint('run time he: ${docs.runtimeType}');
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