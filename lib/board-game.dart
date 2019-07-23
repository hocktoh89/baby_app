import 'dart:ui';

import 'package:baby_app/controller.dart';
import 'package:baby_app/player-ship.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class BoardGame extends Game {
  
  Size screenSize;

  double tileSize;
  PlayerShip playerShip;
  Controller controller;

  BoardGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    playerShip = PlayerShip(this);
    controller = Controller(this);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.height / 9;
  }

  @override
  void render(Canvas canvas) {
    controller.render(canvas);
    playerShip.render(canvas);
  }

  @override
  void update(double t) {
    controller.update(t);
    playerShip.update(t);
  }

  void onPanStart(DragStartDetails details) {
    controller.onPanStart(details);
  }

  void onPanUpdate(DragUpdateDetails details) {
    controller.onPanUpdate(details);
  }

  void onPanEnd(DragEndDetails details) {
    controller.onPanEnd(details);
  }
}

