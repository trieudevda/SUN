import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:do_an/Model/main_connect_firebase.dart';

class Answer{
   String? nameAnswer;
   Bool? result;
  Answer({ this.nameAnswer, this.result});

  Answer.fromJson(Map<String,dynamic> json){
    nameAnswer=json["name_answer"];
    result=json["result"];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data= Map<String,dynamic>();
    data["name_answer"]=nameAnswer;
    data["result"]=result;
    return data;
  }
  Future<dynamic> read() async {
    List<dynamic> data=await MainConnect.getDataFromFirebase('Answer');
    return data;
  }
  Future<dynamic> create(String json) async {
    await MainConnect.setDataFromFirebase('Answer',json)
        .then((e){
          debugPrint('Them thanh cong');
    })
        .catchError((e){
          debugPrint('Them that bai');
    });
  }
  Future<dynamic> write(String doc,String json) async {
    await MainConnect.updateDataFromFirebase('Answer',doc,json)
        .then((e){
      debugPrint('ghi thanh cong');
    })
        .catchError((e){
      debugPrint('ghi that bai');
    });
  }
  Future<dynamic> delete(String doc) async {
    await MainConnect.deleteDataFromFirebase('Answer',doc)
        .then((e){
      debugPrint('Them thanh cong');
    })
        .catchError((e){
      debugPrint('Them that bai');
    });
  }
  // Future<List<Answer>> fetchAnswer(String response){
  //
  // }
}