import 'package:do_an/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class _VoiCustomState extends State<VoiCustom> {
  bool voice = true;
  onChangeNote(bool value) {
    setState(() {
      voice = value;
    });
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
          trailing: customNote(voice, onChangeNote)),
    );
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
      title: Container(
          height: MediaQuery.of(context).size.height / 10.0,
          color: kPrimaryColor,
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
          )),
      content: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height / 6.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [VoiCustom(), SingCustom()],
          ),
        ),
      ),
    );
  }
}
