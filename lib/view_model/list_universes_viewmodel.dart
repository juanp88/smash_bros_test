import 'package:flutter/cupertino.dart';
import 'package:smash_test/models/character_model.dart';
import 'package:smash_test/models/universe_model.dart';
import 'package:smash_test/service/api_status.dart';
import 'package:smash_test/service/service.dart';

class UniversesViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UniverseModel> _universesListModel = [];

  bool get loading => _loading;
  List<UniverseModel> get universesListModel => _universesListModel;

  var allUniverseTag = UniverseModel(
      objectId: '0000', name: 'All', description: 'All universes');

  UniversesViewModel() {
    getUniverses();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUniversesListModel(List<UniverseModel> universesListModel) {
    _universesListModel = universesListModel;
    _universesListModel.insert(0, allUniverseTag);
  }

  getUniverses() async {
    setLoading(true);
    var response = await service.fetchUniverseApi();
    if (response is Success) {
      setUniversesListModel(response.response as List<UniverseModel>);
    }
    setLoading(false);
  }
}
