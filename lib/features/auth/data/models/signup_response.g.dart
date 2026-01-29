// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      userData: json['userData'] == null
          ? null
          : UserData.fromJson(json['userData'] as Map<String, dynamic>),
      status: json['status'] as bool?,
    );

UserData _$UserDataFromJson(Map<String, dynamic> json) =>
    UserData(name: json['name'] as String?, email: json['email'] as String?);
