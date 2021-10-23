import 'package:flutter/material.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("data"),
      ),
      body: Column(
        children: [
          Container(),
          Container(),
        ],
      ),
    );
  }
}
