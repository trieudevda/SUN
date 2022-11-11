import 'package:do_an/Screens/Index/components/mobile_index.dart';
import 'package:flutter/material.dart';
import '../../components/background_custom.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundCustom(
      child:MobileIndex(),
    );
  }
}

