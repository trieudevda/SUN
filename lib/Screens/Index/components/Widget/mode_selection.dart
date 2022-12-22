import 'package:audioplayers/audioplayers.dart';
import 'package:do_an/Screens/Play/play_game.dart';
import 'package:do_an/constants.dart';
import 'package:flutter/material.dart';

class CustomSing extends StatefulWidget {
  const CustomSing({super.key});

  @override
  State<CustomSing> createState() => _CustomSingState();
}

class _CustomSingState extends State<CustomSing> {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Colors.purple.withOpacity(0.5)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
          onPressed: () {
            player.play(AssetSource('button1.mp3'));
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const PlayGame())));
          },
          child: const Text(
            'Chơi đơn',
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}

class CustomSolo extends StatefulWidget {
  const CustomSolo({super.key});

  @override
  State<CustomSolo> createState() => _CustomSoloState();
}

class _CustomSoloState extends State<CustomSolo> {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Colors.purple.withOpacity(0.5)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
          onPressed: () {
            player.play(AssetSource('button1.mp3'));
            // Navigator.push(
            //     context, MaterialPageRoute(builder: ((context) => PlayGame())));
            Navigator.pop(context);
          },
          child: const Text(
            'Đối kháng',
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}

Setting_PlayGame(BuildContext context) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Container(
      color: kPrimaryColor,
      // width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Chọn chế độ chơi',
            style: TextStyle(
                color: kPrimaryLightColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
    content: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 5.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(
              height: 5,
            ),
            CustomSing(),
            Text(
              '-----Hoặc-----',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CustomSolo(),
          ],
        ),
      ),
    ),
    actions: [],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
