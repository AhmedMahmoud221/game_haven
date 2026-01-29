import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ✅ تم الإضافة

class SharedPrefHelper {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  // --- Secure Storage (للبيانات الحساسة كالتوكن) ---
  static Future<void> setSecuredString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> getSecuredString(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteSecuredString(String key) async {
    await _storage.delete(key: key);
  }

  // --- Regular Shared Preferences (للبيانات البسيطة كالـ Onboarding) ---
  static Future<dynamic> setData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    return null;
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }
}

class SharedPrefKeys {
  static const String userToken = 'userToken';
}