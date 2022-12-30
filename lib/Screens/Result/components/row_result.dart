import 'package:flutter/material.dart';
Widget RowResultRow(String text,int value){
  return Row(
    mainAxisAlignment:MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(text,style: const TextStyle(fontWeight: FontWeight.w600),),
      Text(value.toString(),),
    ],
  );
}
Widget RowResultHappy(String text,TextStyle style){
  return Row(
    mainAxisAlignment:MainAxisAlignment.center,
    children: <Widget>[
      Text(text,style: style,),
    ],
  );
}