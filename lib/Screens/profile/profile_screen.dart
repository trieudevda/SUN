import 'package:do_an/Screens/Profile/components/profile_index.dart';
import 'package:do_an/components/background_custom.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const BackgroundCustom(child: ProfileIndex());
  }
}
