import 'package:flutter/material.dart';
import 'package:smash_test/view/characterPage.dart';
import 'package:smash_test/view/filters.dart';
import 'package:smash_test/view/home.dart';

Map<String, WidgetBuilder> generateRoutes() {
  return {
    // 'home': (BuildContext context) => Home(),
    'home': (BuildContext context) => MyHomePage(),
    'character': (BuildContext context) => CharacterPage(),
    'filters': (BuildContext context) => Filters()
  };
}
