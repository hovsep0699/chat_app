import 'dart:math';
import 'dart:ui';

extension RandomExtension on Random {
  Color get randomColor => Color((nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
