import 'package:flutter/material.dart';
import 'package:smash_test/constant.dart';
import 'package:smash_test/providers/sort_provider.dart';
import 'package:smash_test/widgets/radiolist.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgFilter,
      appBar: AppBar(
        title: Text("Filters"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: [
        Expanded(child: TextRadioList()),
        Container(),
      ]),
    );
  }
}
