import 'package:flutter/material.dart';

enum FlickDirection {
  none(0, 0),
  up(0, -1),
  down(0, 1),
  left(-1, 0),
  right(1, 0);

  // X方向とY方向の係数
  final double coefficientX;
  final double coefficientY;
  const FlickDirection(this.coefficientX, this.coefficientY);

  Offset calcOffset(double squareWidth, double squareHeight) =>
      Offset(coefficientX * squareWidth, coefficientY * squareHeight);
}
