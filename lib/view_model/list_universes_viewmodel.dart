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

  UniversesViewModel() {
    getUniverses();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUniversesListModel(List<UniverseModel> universesListModel) {
    _universesListModel = universesListModel;
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
