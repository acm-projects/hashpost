import 'dart:async';

import 'package:flutter/material.dart';

class HashPostTheme {
  // darks
  static Color primaryDark = Color(0xff0F0F0F);
  static Color accentDark = Color(0xff222222);

  // lights
  static Color primaryLight = Color(0xffF0F0F0);
  static Color accentLight = Color(0xffDDDDDD);

  // colors
  static Color primaryColorOne = Color(0xffFF512F);
  static Color primaryColorTwo = Color(0xffDD2476);

  // brightness, and other settings
  static Brightness brightnessDark = Brightness.dark;
  static Brightness brightnessLight = Brightness.light;

  // dark theme data
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    accentColor: accentDark,
    brightness: brightnessDark,
  );

  // light theme data
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    accentColor: accentLight,
    brightness: brightnessLight
  );

  // MINI THEME MANAGEMENT SYSTEM :3
  StreamController<ThemeData> _controller = StreamController<ThemeData>();

  Stream<ThemeData> get theme => _controller.stream;

  changeToDark() {
    _controller.add(darkTheme);
    print("changed theme to dark mode");
  }
  changeToLight() {
    _controller.add(lightTheme);
    print("changed theme to light mode");
  }
}