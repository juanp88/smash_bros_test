import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smash_test/view_model/list_character_viewmodel.dart';
import 'package:smash_test/view_model/list_universes_viewmodel.dart';

import 'providers/sort_provider.dart';
import 'routes/rutas.dart';
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
          ChangeNotifierProvider(create: (_) => CharacterViewModel()),
          ChangeNotifierProvider(create: (_) => UniversesViewModel()),
          ChangeNotifierProvider(create: (_) => SortProvider())
        ],
        child: MaterialApp(
            title: 'Smash Test',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: // OnBoard()
            //  isviewed != 0 ? OnBoard() : MyHomePage(),
            //   MyHomePage()));
            debugShowCheckedModeBanner: false,
            initialRoute: isviewed != 0 ? 'onboarding' : 'home',
            routes: generateRoutes()));
  }
}
