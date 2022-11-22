import 'package:do_an/Model/Question.dart';
import 'package:do_an/Screens/Index/index_screen.dart';
import 'package:do_an/Screens/Play/component/Widget/point_game.dart';
import 'package:do_an/Screens/Play/component/Widget/question.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import '../../../constants.dart';
import '../../Index/components/Widget/ink_well_custom.dart';

class MobilePlayGame extends StatelessWidget {
  const MobilePlayGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor:const Color.fromARGB(100,252, 70, 107 ),
        appBar: AppBar(
          backgroundColor: const Color(0x44000000),
          elevation: 0,
          // leading: Container(alignment:Alignment.center ,child:const FaIcon(FontAwesomeIcons.circleChevronLeft)),
          // actions: [
          //   Container(
          //       alignment:Alignment.centerLeft ,
          //       child:const FaIcon(FontAwesomeIcons.circleDollarToSlot)
          //   ),
          // ],
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/images/Hinh-nen-Vu-Tru.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: const PlayGameInit(),
        ));
  }
}

class PlayGameInit extends StatefulWidget {
  const PlayGameInit({Key? key}) : super(key: key);

  @override
  State<PlayGameInit> createState() => _PlayGameInitState();
}

class _PlayGameInitState extends State<PlayGameInit> {
  int _currentIndex = 0;
  int _minutes = 1;

  @override
  Widget build(BuildContext context) {
    final question =data[_currentIndex];
    void checkQuestion(){
      if(_currentIndex<(data.length-1)){
        setState(() {
          _currentIndex++;
        });
      }
      else{
          AlertDialog alert = const AlertDialog(
            content: Text('da het'),
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: defaultPadding),
        // đang chỉnh
        Container(
          width: double.infinity,
          height:MediaQuery.of(context).size.height*(5/100),
          child: TweenAnimationBuilder<Duration>(
              duration: Duration(minutes: _minutes),
              tween: Tween(begin: Duration(minutes: _minutes), end: Duration.zero),
              onEnd: () {
                print('Timer ended');
              },
              builder: (BuildContext context, Duration value, Widget? child) {
                final minutes = value.inMinutes;
                final seconds = value.inSeconds % 60;
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text('Thời gian: $minutes-$seconds',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)));
              }
          ),
        ),
        Container(
          width: double.infinity,
          height:MediaQuery.of(context).size.height*(20/100),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              QuestionGame(text: question.title),
              PointGame(point: question.point),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        Container(
          height:MediaQuery.of(context).size.height*(50/100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ...question.id_answer.map(
                (e)=>Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      const Divider(
                        thickness: 5,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 300,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30.0),
                          onTap: () {
                            if(true){
                              setState(() {
                                _minutes=1;
                                checkQuestion();
                              });
                            }
                          },
                          child: Ink(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top:10.0, bottom:10.0),
                            child: Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color:const Color.fromRGBO(134, 0, 179, 1),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child:Text(
                                e,
                                style:const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.greenAccent, width: 5),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              )),
          height: MediaQuery.of(context).size.height*(10/100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // icon 50:50
              InkWellCustom(
                  data: const Index(), icon: const FaIcon(FontAwesomeIcons.amazon)),
              InkWellCustom(
                  data: const Index(), icon: const FaIcon(FontAwesomeIcons.amazon)),
              InkWellCustom(
                  data: const Index(), icon: const FaIcon(FontAwesomeIcons.repeat)),
              InkWellCustom(
                  data: const Index(), icon: const FaIcon(FontAwesomeIcons.lightbulb)),
            ],
          ),
        ),
      ],
    );
  }
}
