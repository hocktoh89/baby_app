import 'package:baby_app/board-game.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:baby_app/box-game.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';

// void main() async {
//   Util flameUtil = Util();
//   await flameUtil.fullScreen();
//   await flameUtil.setOrientation(DeviceOrientation.portraitUp);

//   BoxGame game = BoxGame();
//   TapGestureRecognizer tapper = TapGestureRecognizer();
//   tapper.onTapDown = game.onTapDown;
//   runApp(game.widget);
//   flameUtil.addGestureRecognizer(tapper);

// }

void main() async {

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft
  ]);

  await SystemChrome.setEnabledSystemUIOverlays([]);

  Flame.images.loadAll(<String>[
    'joystick_background.png',
    'joystick_knob.png',
    'player_ship_red.png',
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BoardGame game = BoardGame();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration:  BoxDecoration(
          color: Colors.white
        ),
        child: 
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: game.onPanStart,
            onPanUpdate: game.onPanUpdate,
            onPanEnd: game.onPanEnd,
            child: game.widget,
          ),
      ),
    );
  }
}