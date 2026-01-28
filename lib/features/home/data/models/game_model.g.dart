// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameResponse _$GameResponseFromJson(Map<String, dynamic> json) => GameResponse(
  status: json['status'] as String?,
  data: json['data'] == null
      ? null
      : GameData.fromJson(json['data'] as Map<String, dynamic>),
);

GameData _$GameDataFromJson(Map<String, dynamic> json) => GameData(
  games: (json['games'] as List<dynamic>?)
      ?.map((e) => GameModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  author: json['author'] as String?,
  category: json['category'] as String?,
  description: json['description'] as String?,
  releaseDate: json['releaseDate'] as String?,
  language: json['language'] as String?,
  ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
  slug: json['slug'] as String?,
  photo: json['photo'] as String?,
);
