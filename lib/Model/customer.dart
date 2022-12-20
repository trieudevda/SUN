import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an/Model/main_connect_firebase.dart';
import 'package:flutter/material.dart';
class Customer{
  String? fullName;
  String? imageUrl;
  String? phone;
  String? email;
  String? password;
  String? permission;
  double? level;
  int? point;
  int? numberOf50And50;
  int? numberOfQuestionsChanged;
  String? status;
  //
  Customer({this.fullName,this.imageUrl,this.phone,this.email,this.password,this.permission,this.level,this.point,this.numberOf50And50,this.numberOfQuestionsChanged,this.status});
  //
  Customer.fromJson(Map<String,dynamic> json)
  :fullName=json['fullName'],imageUrl=json['imageUrl'],phone=json['phone'],email=json['email'],permission=json['permission'],password=json['password'],level=json['level'],point=json['point'],
  numberOfQuestionsChanged=json['numberOfQuestionsChanged'],status=json['status'],numberOf50And50=json['numberOf50And50'];
  //
  Map<String,dynamic> toJson()=>{
    'fullName':fullName,
    'imageUrl':imageUrl,
    'phone':phone,
    'email':email,
    'password':password,
    'permission':permission,
    'level':level,
    'point':point,
    'numberOfQuestionsChanged':numberOfQuestionsChanged,
    'numberOf50And50':numberOf50And50,
    'status':status,
  };
  //
  Future<dynamic> read() async{
    final data= await MainConnect.getUser();
    return data;
  }
  Future<void> write(String collectionData, Map<String,dynamic> jsonData) async{
    await MainConnect.setDataFromFirebase(collectionData, jsonData);
  }
  Future<dynamic> update()async{}
  Future<dynamic> delete()async{}
}