import 'package:flutter/material.dart';
import 'package:smash_test/models/character_model.dart';
import 'package:smash_test/view_model/list_character_viewmodel.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CharacterViewModel characterViewModel = context.watch<CharacterViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Fighters'),
      ),
      body: Container(
        child: Column(
          children: [_ui(characterViewModel)],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

_ui(CharacterViewModel characterViewModel) {
  if (characterViewModel.loading) {
    return Container();
  }
  return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            CharacterModel characterModel =
                characterViewModel.characterListModel[index];
            return Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.network(
                        characterModel.imageUrl,
                        alignment: Alignment.center,
                      )),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(characterModel.name),
                        Text(characterModel.universe)
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(characterModel.price),
                          Text(characterModel.rate.toString()),
                          Text(characterModel.downloads.toString()),
                        ],
                      )),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: characterViewModel.characterListModel.length));
}
