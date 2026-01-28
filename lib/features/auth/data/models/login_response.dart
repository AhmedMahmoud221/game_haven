import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? status;
  final String? token;
  final UserData? data;

  LoginResponse({this.status, this.token, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: "user") // لو الباكيند باعتها جوا كلمة user
  final UserModel? userModel;

  UserData({this.userModel});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}

@JsonSerializable()
class UserModel {
  final String? name;
  final String? email;
  @JsonKey(name: "_id")
  final String? id;

  UserModel({this.name, this.email, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}