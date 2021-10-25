import 'package:flutter/material.dart';

class SortProvider extends ChangeNotifier {
  late int selectedButton;
  late String selectedFilter;
  late String _filter;
  List<String> filtersList = ['Name', 'Price', 'Rate', 'Downloads'];
  //when no style is selected, return default TextStyle

  get filter => _filter;

  SortProvider() {
    selectedButton = 0;
    setSelectedButton(selectedButton);
    _filter = "Name";
  }

  void setSelectedButton(int? index) async {
    selectedButton = index ?? selectedButton;
    _filter = filtersList[index ?? 0];
    // print(selectedButton);
    //print(filter);
    //filtersList;

    notifyListeners();
  }
}
