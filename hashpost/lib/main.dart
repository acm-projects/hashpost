import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() => runApp(HashPost());

class HashPost extends StatelessWidget {
  const HashPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // removes the debug banner
      debugShowCheckedModeBanner: false,
      // need to work on this
      theme: ThemeData(
        // basic theme data
        brightness: Brightness.light,
        primaryColor: Color(0xffF1F1F3),
        accentColor: Color(0xff04152A),

        // default font family
        fontFamily: "Poppins",

        // text style presets
        textTheme: TextTheme(
          title: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w500),
          body1: TextStyle(fontSize: 14.0)
        )
      ),

      // home screen, which we will replace with initialRoute when we add routes
      home: HomeScreen()
    );
  }
}