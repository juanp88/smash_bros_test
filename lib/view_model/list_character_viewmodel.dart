import 'package:flutter/cupertino.dart';
import 'package:smash_test/models/character_model.dart';
import 'package:smash_test/service/api_status.dart';
import 'package:smash_test/service/service.dart';

class CharacterViewModel extends ChangeNotifier {
  bool _loading = false;
  List<CharacterModel> _characterListModel = [];

  bool get loading => _loading;
  List<CharacterModel> get characterListModel => _characterListModel;

  CharacterViewModel() {
    getCharacters();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setCharacterListModel(List<CharacterModel> characterListModel) {
    _characterListModel = characterListModel;
  }

  getCharacters() async {
    setLoading(true);
    var response = await service.fetchCharacterApi();
    if (response is Success) {
      setCharacterListModel(response.response as List<CharacterModel>);
    }
    setLoading(false);
  }
}
