import 'package:do_an/Model/main_connect_firebase.dart';
import 'package:flutter/material.dart';

import '../Screens/Result/result_game.dart';
import '../constants.dart';

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
Future<dynamic> showMessageContinueGame(BuildContext context,String text){
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: borderAlert,
        backgroundColor: backgroundAlert,
        content: Text(text,style: bodyAlert,),
        actions: <Widget>[
          TextButton(
            style: textButtonAlert,
            onPressed: (){ },
            child: const Text('Tiếp tục',style: buttonAlert,),
          ),
        ],
      );
    },
  );
}
Future<dynamic> showMessageEndGame(BuildContext context,String text,int point,int exp,int numberOfAnswers){
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: borderAlert,
        backgroundColor: backgroundAlert,
        content: Text(text,style: bodyAlert,),
        actions: <Widget>[
          TextButton(
            style: textButtonAlert,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultGame(point: point,exp: exp,numberOfAnswers: numberOfAnswers,)
                ),
              );
            },
            child: const Text('Chấp nhận',style: buttonAlert,),
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
        shape: borderAlert,
        backgroundColor: backgroundAlert,
        content: Text(text,style: bodyAlert,),
        actions: <Widget>[
          TextButton(
            style: textButtonAlert,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultGame(point: point,exp: exp,numberOfAnswers: numberOfAnswers,)
                ),
              );
            },
            child: const Text('Chấp nhận',style: buttonAlert),
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
        shape: borderAlert,
        backgroundColor: backgroundAlert,
        title: const Text(
          "Thông báo!",
          textAlign: TextAlign.center,
          style: titleAlert,
        ),
        content: const Text(
          'Chấp nhận đăng xuất, vui lòng nhấn tiếp tục.',
          style: bodyAlert,
        ),
        actions: <Widget>[
          TextButton(
            style: textButtonAlert,
            onPressed: (){
              MainConnect().logoutFirebase(context);
            },
            child:const Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
              child: Text('Tiếp tục',style: buttonAlert,),
            ),
          ),
        ],
      );
    },
  );
}