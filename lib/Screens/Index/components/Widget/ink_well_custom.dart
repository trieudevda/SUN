import 'package:audioplayers/audioplayers.dart';
import 'package:do_an/Screens/Index/components/Widget/setting_game.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';

class InkWellCustom extends StatelessWidget {
  InkWellCustom({Key? key, required this.icon, required this.data})
      : super(key: key);
  FaIcon icon;
  Widget data;
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () {
        player.play(AssetSource('button1.mp3'));
        // AlertDialog alert = AlertDialog(
        //   content: Text('check'),
        // );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return data;
          },
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => data
        //   ),
        // );
      },
      child: Ink(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color.fromRGBO(134, 0, 179, 1),
          ),
          padding: const EdgeInsets.all(20.0),
          child: icon,
        ),
      ),
    );
  }
}
