import 'package:flutter/material.dart';
import 'package:smash_test/view/characterPage.dart';
import 'package:smash_test/view/filterPage.dart';
import 'package:smash_test/view/home.dart';
import 'package:smash_test/view/onboard/onboard.dart';

Map<String, WidgetBuilder> generateRoutes() {
  return {
    // 'home': (BuildContext context) => Home(),
    'home': (BuildContext context) => MyHomePage(),
    'character': (BuildContext context) => CharacterPage(),
    'filters': (BuildContext context) => FilterPage(),
    'onboarding': (BuildContext context) => OnBoard()
  };
}
