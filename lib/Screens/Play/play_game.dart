import 'package:do_an/Screens/Play/component/mobile_play_game.dart';
import 'package:flutter/material.dart';

import '../../components/background_custom.dart';

class PlayGame extends StatelessWidget {
  const PlayGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundCustom(
        child: MobilePlayGame(),
    );
  }
}

