// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  author: json['author'] as String?,
  category: json['category'] as String?,
  photo: json['photo'] as String?,
  description: json['description'] as String?,
  releaseDate: json['releaseDate'] as String?,
  language: json['language'] as String?,
  slug: json['slug'] as String?,
);

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
  'name': instance.name,
  'price': instance.price,
  'author': instance.author,
  'category': instance.category,
  'photo': instance.photo,
  'description': instance.description,
  'releaseDate': instance.releaseDate,
  'language': instance.language,
  'slug': instance.slug,
};
