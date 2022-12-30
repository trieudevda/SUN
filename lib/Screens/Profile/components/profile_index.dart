import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../history/history.dart';

class ProfileIndex extends StatelessWidget {
  const ProfileIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Center(
          child: Text('Thông Tin cá nhân'.toUpperCase()),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const ProfileInit(),
      ),
    );
  }
}

class ProfileInit extends StatefulWidget {
  const ProfileInit({super.key});

  @override
  State<ProfileInit> createState() => _ProfileInitState();
}

class _ProfileInitState extends State<ProfileInit> {
  String? fullName = '';
  String? level = '';
  String? email = '';
  String? phone = '';
  Future _getDataFormDatabase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          snapshot.data()!["fullName"];
          snapshot.data()!["level"];
          snapshot.data()!["email"];
          snapshot.data()!["phone"];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFormDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 2 / 3,
          margin: const EdgeInsets.fromLTRB(50, 100, 50, 40),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.purple, width: 4.0),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.purple,
                    maxRadius: 60.0,
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 120,
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tên: ' + fullName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Demo'),
                              );
                            });
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              Text(
                'Cấp: ' + level!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email: ' + email!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'SĐT: ' + phone!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
                margin: const EdgeInsets.fromLTRB(50, 25, 50, 25),
                child: ElevatedButton(
                    onPressed: () {
                      player.play(AssetSource('button1.mp3'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => History(tran:'50',rank:5, cap:'179', ten:'ahao', ttcn:'dasd', ttcd:'ds')
                        ),
                      );
                    },
                    child: Text('Lịch sử đấu'.toUpperCase()))))
      ],
    );
  }
}
