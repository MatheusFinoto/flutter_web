import 'package:flutter/material.dart';
import 'package:teste_web/src/utils/Helper.dart' as GLOBAL;
import 'package:teste_web/src/view/base/base_screen.dart';
import 'package:teste_web/src/view/home_screen/home_screen.dart';
import 'package:teste_web/src/view/login/login_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  //initializeDateFormatting().then((_) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Web',
      theme: ThemeData(
        // primaryColor: GLOBAL.redDark,
        // accentColor: GLOBAL.redDark,
        // brightness: Brightness.dark,
        // scaffoldBackgroundColor: GLOBAL.darkerDark,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      localizationsDelegates: [
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        // DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      home: BaseScreen()//LoginScreen(),
    );
  }
}
