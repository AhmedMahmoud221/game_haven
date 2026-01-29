import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response.g.dart';

@JsonSerializable(createToJson: false)
class UserProfileResponse {
  final String? status;
  final UserData? data;

  UserProfileResponse({this.status, this.data});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserData {
  final User? user;

  UserData({this.user});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class User {
  final String? id;
  final String? name;
  final String? email;
  final String? username;
  final String? role;

  User({this.id, this.name, this.email, this.username, this.role});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}