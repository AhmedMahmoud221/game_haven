// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as String?,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  userModel: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  name: json['name'] as String?,
  email: json['email'] as String?,
  id: json['_id'] as String?,
);
