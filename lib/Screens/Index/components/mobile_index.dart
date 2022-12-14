import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an/Model/customer.dart';
import 'package:do_an/Model/main_connect_firebase.dart';
import 'package:do_an/Model/question.dart';
import 'package:do_an/Screens/Index/components/Widget/rating.dart';
import 'package:do_an/Screens/Index/components/Widget/statistics.dart';
import 'package:do_an/Screens/Index/components/Widget/ink_well_custom.dart';
import 'package:do_an/Screens/Index/components/Widget/setting_game.dart';
import 'package:do_an/Screens/Index/components/Widget/widget_diem.dart';
import 'package:do_an/Screens/Index/components/Widget/mode_selection.dart';
import 'package:do_an/Screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../components/function_custom.dart';
import '../../../constants.dart';

class MobileIndex extends StatefulWidget {
  const MobileIndex({Key? key}) : super(key: key);

  @override
  State<MobileIndex> createState() => _MobileIndexState();
}

class _MobileIndexState extends State<MobileIndex> {
  final player = AudioPlayer();
  final mainConnect = MainConnect();
  final customer = Customer();
  final dataCustomer = Customer().read().toString();
  late Map<String,dynamic> data;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: Question().read('question'),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          // debugPrint('${snapshot.data.runtimeType}');
          if(snapshot.connectionState==ConnectionState.waiting){
            EasyLoading.show(status: 'Đang tải...');
          }
          if(snapshot.connectionState==ConnectionState.done){
            EasyLoading.dismiss();
            if(snapshot.hasData){
              return Column(
                children: [
                  snapshot.data!.map((e){
                    debugPrint('${e.toString()}');
                  })
                  // for(var data in snapshot.data)
                    // for(var datachild in data)
                    // data.map((e){
                    //   Column(
                    //     children: [
                    //       Text('check'+e.toString()),
                    //       SizedBox(height: 30,)
                    //     ],
                    //   );
                    // })
                  // Text(snapshot.data.toString()),
                ],
              );
            }
            if(snapshot.hasError){

            }
          }
          return Container();
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color.fromRGBO(147, 78, 189, 1.0),
                      child:  IconButton(
                        iconSize: 30,
                        onPressed: () {
                          logoutGame(context);
                        },
                        icon: const Icon(
                          Icons.logout,
                          color:Colors.white,
                        ),
                      ),
                    ),
                    WidgetDiem(),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 104,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 100),
                        child:
                        // SvgPicture.asset("image/icons/signup.svg"),
                        Image.asset('image/gifs/sanh.gif'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 100),
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                width: 200.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    player.play(AssetSource('button1.mp3'));
                                    // Customer().read();
                                    Setting_PlayGame(context);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        size: 50.0,
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Chơi Ngay".toUpperCase(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWellCustom(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.crown,
                                        color: Colors.white,
                                      ),
                                      data: const Ratings()),
                                  InkWellCustom(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.chartSimple,
                                        color: Colors.white,
                                      ),
                                      data: const Charts()),
                                  InkWellCustom(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.gears,
                                        color: Colors.white,
                                      ),
                                      data: const Setting()),
                                  InkWellCustom(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.user,
                                        color: Colors.white,
                                      ),
                                      data: const ProfileScreen()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
