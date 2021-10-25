import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smash_test/providers/sort_provider.dart';

class TextRadioList extends StatefulWidget {
  const TextRadioList();
  @override
  _TextRadioListState createState() => _TextRadioListState();
}

class _TextRadioListState extends State<TextRadioList> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SortProvider>(context);
    return ListView.builder(
      itemBuilder: (ctx, index) => RadioListTile<int>(
        value: index,
        groupValue: provider.selectedButton,
        onChanged: provider.setSelectedButton,
        title: Text(provider.filtersList[index]),
      ),
      itemCount: provider.filtersList.length,
    );
  }
}
