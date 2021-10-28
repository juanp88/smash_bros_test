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
    return LimitedBox(
      maxHeight: MediaQuery.of(context).size.height * 0.28,
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (ctx, index) => RadioListTile<int>(
                tileColor: Colors.white,
                value: index,
                groupValue: provider.selectedButton,
                onChanged: provider.setSelectedButton,
                title: Text(provider.filtersList[index]),
              ),
          itemCount: provider.filtersList.length,
          separatorBuilder: (context, index) => Divider(
                height: 1,
              )),
    );
  }
}
