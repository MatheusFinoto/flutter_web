

import 'package:flutter/material.dart';
import 'package:teste_web/src/utils/Helper.dart' as GLOBAL;

import 'package:teste_web/src/view/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: GLOBAL.redDark,
        accentColor: GLOBAL.redDark,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: GLOBAL.darkerDark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}


