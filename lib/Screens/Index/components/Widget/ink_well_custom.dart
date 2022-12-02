
import 'package:do_an/Screens/Index/components/Widget/setting_game.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';

Future<dynamic> _showSetting(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Container(
          color: kPrimaryColor,
          child: Row(
            children: [
              // ListTile(
              //   leading: const Icon(
              //     Icons.settings,
              //     color: Colors.white,
              //   ),
              //   title: const Text(
              //     'Cài đặt',
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20),
              //   ),
              //   trailing: IconButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       icon: const Icon(
              //         Icons.close,
              //         color: Colors.white,
              //       )),
              // )
              Text('demo'),
            ],

          ),
        ),
        content: SingleChildScrollView(
          child: Container(
            height: 200,
            // height: MediaQuery.of(context).size.height / 6.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  height: 5,
                ),
                VoiCustom(),
                SingCustom()
              ],
            ),
          ),
        ),
      );
    },
  );
}
class InkWellCustom extends StatelessWidget {
  InkWellCustom({Key? key, required this.icon,required this.data}) : super(key: key);
  FaIcon icon;
  Widget data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () {
        _showSetting(context);
        // AlertDialog alert = AlertDialog(
        //   content: Text('check'),
        // );
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return alert;
        //   },
        // );
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
            color:const Color.fromRGBO(134, 0, 179, 1),
          ),
          padding: const EdgeInsets.all(20.0),
          child:icon,
        ),
      ),
    );
  }
}
