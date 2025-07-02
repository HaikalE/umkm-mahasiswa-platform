import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<void> setString(String key, String value);
  Future<String?> getString(String key);
  Future<void> setBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<void> setInt(String key, int value);
  Future<int?> getInt(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _prefs;
  
  LocalStorageImpl(this._prefs);
  
  @override
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }
  
  @override
  Future<String?> getString(String key) async {
    return _prefs.getString(key);
  }
  
  @override
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }
  
  @override
  Future<bool?> getBool(String key) async {
    return _prefs.getBool(key);
  }
  
  @override
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }
  
  @override
  Future<int?> getInt(String key) async {
    return _prefs.getInt(key);
  }
  
  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
  
  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}

// Storage Keys
class StorageKeys {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userType = 'user_type';
  static const String userId = 'user_id';
  static const String isFirstTime = 'is_first_time';
  static const String onboardingCompleted = 'onboarding_completed';
  static const String profileSetupCompleted = 'profile_setup_completed';
  static const String notificationEnabled = 'notification_enabled';
  static const String darkModeEnabled = 'dark_mode_enabled';
  static const String language = 'language';
}