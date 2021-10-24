import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  Filters({Key? key}) : super(key: key);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Filters"),
      leading: GestureDetector(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
