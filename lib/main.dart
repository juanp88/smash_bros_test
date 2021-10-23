import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smash_test/view_model/list_character_viewmodel.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CharacterViewModel())
        ],
        child: MaterialApp(
            title: 'Smash Test',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: // OnBoard()
                //  isviewed != 0 ? OnBoard() : MyHomePage(),
                MyHomePage()));
  }
}
