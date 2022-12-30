import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;
const TextStyle textTitle=TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.black);
const TextStyle textHeading=TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.black);
const TextStyle textBody=TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.black);

// thong bao
RoundedRectangleBorder borderAlert= RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0));
ButtonStyle textButtonAlert=TextButton.styleFrom(foregroundColor: Colors.white,backgroundColor:const Color.fromRGBO(231, 153, 255, 1),);
const Color backgroundAlert= Color.fromRGBO(249, 230, 255, 1);
const TextStyle titleAlert=TextStyle(color: Colors.red,fontSize: 24,);
const TextStyle bodyAlert=TextStyle(fontSize: 16);
const TextStyle buttonAlert=TextStyle(fontSize: 16,);