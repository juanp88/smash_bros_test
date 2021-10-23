// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

List<CharacterModel> characterModelFromJson(String str) =>
    List<CharacterModel>.from(
        json.decode(str).map((x) => CharacterModel.fromJson(x)));

String characterModelToJson(List<CharacterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharacterModel {
  CharacterModel({
    required this.objectId,
    required this.name,
    required this.universe,
    required this.price,
    required this.popular,
    required this.rate,
    required this.downloads,
    required this.description,
    required this.createdAt,
    required this.imageUrl,
  });

  String objectId;
  String name;
  String universe;
  String price;
  bool popular;
  int rate;
  String downloads;
  String description;
  String createdAt;
  String imageUrl;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        objectId: json["objectID"] == null ? null : json["objectID"],
        name: json["name"] == null ? null : json["name"],
        universe: json["universe"] == null ? null : json["universe"],
        price: json["price"] == null ? null : json["price"],
        popular: json["popular"] == null ? null : json["popular"],
        rate: json["rate"] == null ? null : json["rate"],
        downloads: json["downloads"] == null ? null : json["downloads"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        imageUrl: json["imageURL"] == null ? null : json["imageURL"],
      );

  Map<String, dynamic> toJson() => {
        "objectID": objectId == null ? null : objectId,
        "name": name == null ? null : name,
        "universe": universe == null ? null : universe,
        "price": price == null ? null : price,
        "popular": popular == null ? null : popular,
        "rate": rate == null ? null : rate,
        "downloads": downloads == null ? null : downloads,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt,
        "imageURL": imageUrl == null ? null : imageUrl,
      };
}
