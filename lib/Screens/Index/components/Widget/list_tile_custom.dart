import 'package:flutter/material.dart';

TextStyle styleCustom=const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
Widget ListTileCustom(final leading, final title, final trailing){
  return ListTile(
    leading:Text(
      leading.toString(),
      style: styleCustom,
    ),
    title: Text(
      title,
      style:styleCustom,
      overflow: TextOverflow.ellipsis,
    ),
    trailing: Text(
      trailing.toString(),
      style: styleCustom,
    ),
  );
}
Widget ListTileIconCustom(IconData leading, final title, final trailing){
  return ListTile(
    leading:Icon(leading),
    title: Text(
      title,
      style:styleCustom,
      overflow: TextOverflow.ellipsis,
    ),
    trailing: Text(
      trailing.toString(),
      style: styleCustom,
    ),
  );
}