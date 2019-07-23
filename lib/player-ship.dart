import 'dart:ui';

import 'package:baby_app/board-game.dart';
import 'package:flame/sprite.dart';
import 'dart:math';

class PlayerShip {

  final BoardGame game;
  double speed = 80.0;

  double aspectRatio = 1.4;
  double size;
  Rect rect;
  Sprite sprite;

  bool move = false;
  double lastMoveRadAngle = 0.0;

  PlayerShip(this.game) {
      size = game.tileSize * aspectRatio;

      rect = Rect.fromLTWH(
          game.screenSize.width / 2 - (size / 2),
          game.screenSize.height / 2 - (size / 2),
          size,
          size
      );

      sprite = Sprite('player_ship_red.png');
  }

  void render(Canvas canvas) {
    // sprite.renderRect(canvas, rect);
    canvas.save();
    canvas.translate(rect.center.dx, rect.center.dy);
    canvas.rotate(lastMoveRadAngle == 0.0
        ? 0.0
        : lastMoveRadAngle + (pi /2));
    canvas.translate(-rect.center.dx, -rect.center.dy);
    sprite.renderRect(canvas, rect);
    canvas.restore();
  }

  void update(double t) {
    if(move) {
      double nextX = (speed * t) * cos(lastMoveRadAngle);
      double nextY = (speed * t) * sin(lastMoveRadAngle);
      Offset nextPoint = Offset(nextX, nextY);

      Offset diffBase = Offset(
          rect.center.dx + nextPoint.dx,
          rect.center.dy + nextPoint.dy) - rect.center;
      rect = rect.shift(diffBase);
    }
  }
}