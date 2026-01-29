// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  username: json['username'] as String?,
  role: json['role'] as String?,
);
