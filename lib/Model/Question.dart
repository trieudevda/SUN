import 'dart:convert';

import 'package:do_an/Model/main_connect_firebase.dart';

class Question {
  String? idQuestionTopic;
  final idAnswer;
  String? title;
  String? difficultyLevel;
  int? addExperience;
  int? point;
  String? status;
  Question({this.idQuestionTopic, this.idAnswer, this.title,this.difficultyLevel, this.addExperience, this.point,this.status});
  Future<List<Map<String,dynamic>>> read(final collection)async{
    final data=await MainConnect.getDataFromFirebase(collection,'');
    return data;
  }
  Map<String,dynamic> toJson()=>{

  };
}

final List<Question> data = [
  Question(
    idQuestionTopic: '2',
    idAnswer: [
      '2',
      '3',
      '4',
      '5',
    ],
    title:'Quá trình phát triển của văn học Việt Nam từ cách mạng tháng Tám năm 1945 đến năm 1975 trải qua mấy chặng đường chính?',
    difficultyLevel:'1',
    addExperience:100,
    point: 10,
    status: 'false',
  ),
];
