import 'package:do_an/Screens/Index/components/mobile_index.dart';
import 'package:do_an/components/function_custom.dart';
import 'package:flutter/material.dart';
import '../../components/background_custom.dart';

class IndexCustom extends StatelessWidget {
  const IndexCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WillPopScope(
      onWillPop: onWillPop,
      child:  BackgroundCustom(
        child:MobileIndex(),
      ),
    );
  }
}

