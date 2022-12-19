import 'package:do_an/Screens/Play/component/mobile_play_game.dart';
import 'package:flutter/material.dart';

import '../../components/background_custom.dart';
import '../../components/function_custom.dart';

class PlayGame extends StatelessWidget {
  const PlayGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPopExitGameMain()async{
      return await onWillPopExitGame(context);
    }
    return WillPopScope(
      onWillPop: onWillPopExitGameMain ,
      child: const BackgroundCustom(
          child: MobilePlayGame(),
      ),
    );
  }
}

