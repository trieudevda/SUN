import 'package:do_an/Model/main_connect_firebase.dart';
import 'package:do_an/Screens/Index/components/Widget/game_statistics.dart';
import 'package:do_an/Screens/Index/components/Widget/ink_well_custom.dart';
import 'package:do_an/Screens/Index/components/Widget/mode_selection.dart';
import 'package:do_an/Screens/Index/components/Widget/widget_diem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants.dart';

class MobileIndex extends StatefulWidget {
  const MobileIndex({Key? key}) : super(key: key);

  @override
  State<MobileIndex> createState() => _MobileIndexState();
}

class _MobileIndexState extends State<MobileIndex> {
  final mainConnect = MainConnect();
  //Setting play game show index



  //Game statistics show index
  Future<dynamic> _showStatistics(BuildContext context, String content) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Container(
            // color: kPrimaryColor,
            child: Row(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.bar_chart_outlined,
                    color: Colors.purple,
                  ),
                  title: const Text(
                    'Số liệu thống kê',
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 2.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 5,
                  ),
                  CustomChart(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    mainConnect.logoutFirebase(context);
                  },
                  icon: const Icon(Icons.logout),
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
                    child: SvgPicture.asset("image/icons/signup.svg"),
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
                                  icon: const FaIcon(FontAwesomeIcons.gears),
                                  data: Container()),
                              // InkWellCustom(
                              //     icon: const FaIcon(
                              //         FontAwesomeIcons.chartSimple),
                              //     data:  _showSetting(context)),
                              // InkWellCustom(
                              //     icon:
                              //     const FaIcon(FontAwesomeIcons.crown),
                              //     data:  _showSetting(context)),
                              // InkWellCustom(
                              //     icon: const FaIcon(FontAwesomeIcons.users),
                              //     data:  _showSetting(context)),

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
      ),
    );
  }
}
