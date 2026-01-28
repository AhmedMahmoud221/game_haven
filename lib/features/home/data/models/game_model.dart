import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable(createToJson: false)
class GameResponse {
  final String? status;
  final GameData? data;

  GameResponse({this.status, this.data});

  factory GameResponse.fromJson(Map<String, dynamic> json) => _$GameResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GameData {
  final List<GameModel>? games;

  GameData({this.games});

  factory GameData.fromJson(Map<String, dynamic> json) => _$GameDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class GameModel {
  @JsonKey(name: "_id") // عشان يربط الـ _id اللي جاي من MongoDB
  final String? id;
  final String? name;
  final double? price;
  final String? author;
  final String? category;
  final String? description;
  final String? releaseDate;
  final String? language;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final String? slug;
  final String? photo; // لو الباكيند هيبعت صورة مستقبلاً

  GameModel({
    this.id,
    this.name,
    this.price,
    this.author,
    this.category,
    this.description,
    this.releaseDate,
    this.language,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.slug,
    this.photo,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);
}