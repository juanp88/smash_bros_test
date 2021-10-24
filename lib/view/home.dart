import 'package:flutter/material.dart';
import 'package:smash_test/models/character_model.dart';
import 'package:smash_test/models/universe_model.dart';
import 'package:smash_test/view_model/list_character_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:smash_test/view_model/list_universes_viewmodel.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String universeFilter = "";
  @override
  Widget build(BuildContext context) {
    CharacterViewModel characterViewModel = context.watch<CharacterViewModel>();
    UniversesViewModel universesViewModel = context.watch<UniversesViewModel>();
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fighters'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('filters');
              },
              icon: Icon(Icons.filter_list))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: queryData.size.width,
                  child: _universeList(universesViewModel, context),
                )
              ],
            ),
            _ui(characterViewModel, context)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _universeButton(String universeName, String id, BuildContext context) {
    return Container(
        height: 50,
        child: FloatingActionButton.extended(
            heroTag: id,
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            label: Text(universeName),
            onPressed: () {
              setState(() {
                if (universeName == 'All') {
                  universeFilter = "";
                } else {
                  universeFilter = universeName;
                }
              });

              print(universeFilter);
              // Provider.of<CharacterViewModel>(context, listen: false)
              //     .changeUniverseFilter(universeName);
            }));
  }

//listview para filtro de universos
  _universeList(UniversesViewModel universesViewModel, BuildContext context) {
    var universeList = universesViewModel.universesListModel;
    if (universesViewModel.loading) {
      return Container();
    }

    return Container(
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              UniverseModel universeModel = universeList[index];

              return Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Column(
                  children: [
                    _universeButton(
                        universeModel.name, universeModel.objectId, context)
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: universeList.length));
  }

//listview de personajes
  Widget _ui(CharacterViewModel characterViewModel, BuildContext context) {
    if (characterViewModel.loading) {
      return Container();
    }
    // print(data.characterListModel.toString());
    var allCharacters = characterViewModel.characterListModel;
    var filteredCharacters = characterViewModel.characterListModel
        .where((character) =>
            character.universe.toLowerCase() == (universeFilter.toLowerCase()))
        .toList();

    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              // allCharacters[index];
              CharacterModel characterModel = (universeFilter.isEmpty
                  ? allCharacters[index]
                  : filteredCharacters[index]);
              // characterViewModel.characterListModel[index];

              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'character',
                        arguments: characterModel);
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Image.network(
                          characterModel.imageUrl,
                          alignment: Alignment.center,
                        ),
                      )),
                      Expanded(
                        child: Column(
                          children: [
                            Text(characterModel.name),
                            Text(characterModel.universe)
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Text("Price: " + characterModel.price),
                          Text("Rate: " + characterModel.rate.toString()),
                          Text("Downloads: " + characterModel.downloads),
                        ],
                      )),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: universeFilter.isEmpty
                ? allCharacters.length
                : filteredCharacters.length));
  }
}
