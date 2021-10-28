import 'package:flutter/material.dart';

class SortProvider extends ChangeNotifier {
  late int selectedButton;
  late String selectedFilter;
  late String _filter;
  double _rate = 0.0;
  List<String> filtersList = ['Name', 'Price', 'Rate', 'Downloads'];
  //when no style is selected, return default TextStyle

  get filter => _filter;
  get rate => _rate;

  SortProvider() {
    selectedButton = 0;
    setSelectedButton(selectedButton);
    _filter = "Name";
  }

  setRate(double rate) {
    _rate = rate;
    notifyListeners();
  }

  void setSelectedButton(int? index) async {
    selectedButton = index ?? selectedButton;
    _filter = filtersList[index ?? 0];

    notifyListeners();
  }
}
