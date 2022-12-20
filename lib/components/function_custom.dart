import 'package:do_an/Model/main_connect_firebase.dart';
import 'package:flutter/material.dart';

import '../Screens/Result/result_game.dart';

Future<bool> onWillPop()async{
  return false;
}
Future<bool> onWillPopExitGame(BuildContext context) async{
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Bạn muốn thoát trận?'),
      content: const Text('Thoát trận sẽ không lưu dữ liệu liệu hiện tại'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Trở lại'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Đồng ý'),
        ),
      ],
    ),
  ) ??
  false;
}
Future<dynamic> showMessageEndGame(BuildContext context,String text,int point,int exp,int numberOfAnswers){
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultGame(point: point,exp: exp,numberOfAnswers: numberOfAnswers,)
                ),
              );
            },
            child: const Text('Chấp nhận'),
          ),
        ],
      );
    },
  );
}
Future<void> showMessageEndGame1(BuildContext context,String text,int point,int exp,int numberOfAnswers){
 return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultGame(point: point,exp: exp,numberOfAnswers: numberOfAnswers,)
                ),
              );
            },
            child: const Text('Chấp nhận'),
          ),
        ],
      );
    },
  );
}
Future<dynamic> logoutGame(BuildContext context)async{
  return await showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text('Bạn chắc chắn muốn đăng xuất!'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              MainConnect().logoutFirebase(context);
            },
            child: const Text('Chấp nhận'),
          ),
        ],
      );
    },
  );
}