import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  final String? name;
  final double? price;
  final String? author;
  final String? category;
  final String? photo;
  final String? description;
  final String? releaseDate;
  final String? language;
  final String? slug;

  GameModel({
    this.name,
    this.price,
    this.author,
    this.category,
    this.photo,
    this.description,
    this.releaseDate,
    this.language,
    this.slug,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}