import 'package:audioplayers/audioplayers.dart';
import 'package:do_an/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget customNote(bool val, Function onChangeMethod) {
  return CupertinoSwitch(
      activeColor: kPrimaryColor,
      value: val,
      onChanged: (newValue) {
        onChangeMethod(newValue);
      });
}

class VoiCustom extends StatefulWidget {
  const VoiCustom({super.key});

  @override
  State<VoiCustom> createState() => _VoiCustomState();
}

bool voice = true;

class _VoiCustomState extends State<VoiCustom> {
  final player = AudioPlayer();

  onChangeNote(bool value) {
    setState(() {
      voice = value;
    });
  }

  @override
  _saveVoice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("voice", voice);
  }

  @override
  void checkVoi(bool voice) {
    if (voice == true) {
      setState(() {
        player.play(AssetSource('button1.mp3'));
      });
    } else {
      setState(() {
        player.stop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: const Icon(Icons.volume_up_sharp),
      title: const Text(
        'Âm thanh',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text(''),
      trailing: CupertinoSwitch(
          activeColor: kPrimaryColor,
          value: voice,
          onChanged: (newValue) {
            onChangeNote(newValue);
            checkVoi(voice);
            _saveVoice();
          }),
    ));
  }
}

class SingCustom extends StatefulWidget {
  const SingCustom({super.key});

  @override
  State<SingCustom> createState() => _SingCustomState();
}

class _SingCustomState extends State<SingCustom> {
  bool sing = true;
  onChangeNote(bool value) {
    setState(() {
      sing = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          leading: const Icon(Icons.volume_up_outlined),
          title: const Text(
            'Âm nhạc',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text(''),
          trailing: customNote(sing, onChangeNote)),
    );
  }
}

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titlePadding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
      title: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: kPrimaryColor,
        ),
        height: MediaQuery.of(context).size.height / 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
            Text(
              'Cài đặt',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 10),
      content: Container(
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color:Color.fromRGBO(249, 230, 255, 1),
        ),
        height: MediaQuery.of(context).size.height*0.13,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: const [
            VoiCustom(),
            SingCustom()
          ],
        ),
      ),
    );
  }
}
