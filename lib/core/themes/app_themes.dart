import 'package:flutter/material.dart';
import '../../resources/assets/fonts.gen.dart';
import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: lightColorScheme.brightness,
  colorScheme: lightColorScheme,
  useMaterial3: true,
  fontFamily: FontFamily.inter,
  scaffoldBackgroundColor: lightColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: darkColorScheme.brightness,
  colorScheme: darkColorScheme,
  useMaterial3: true,
  fontFamily: FontFamily.inter,
  scaffoldBackgroundColor: darkColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.surface,
  ),
);
