import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/home.dart';
import 'view/onboard/onboard.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smash Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: // OnBoard()
          isviewed != 0 ? OnBoard() : MyHomePage(title: 'Smash Demo Home Page'),
    );
  }
}
