import 'dart:convert';

List<UniverseModel> universeModelFromJson(String str) =>
    List<UniverseModel>.from(
        json.decode(str).map((x) => UniverseModel.fromJson(x)));

String universeModelToJson(List<UniverseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniverseModel {
  UniverseModel({
    required this.objectId,
    required this.name,
    required this.description,
  });

  String objectId;
  String name;
  String description;

  factory UniverseModel.fromJson(Map<String, dynamic> json) => UniverseModel(
        objectId: json["objectID"] == null ? null : json["objectID"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "objectID": objectId == null ? null : objectId,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
      };
}
