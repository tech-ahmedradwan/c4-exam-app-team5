import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_storage.dart';

@LazySingleton(as: AppStorage)
class AppStorageImpl implements AppStorage {
  AppStorageImpl(this.prefs, this.secure);
  final SharedPreferences prefs;
  final FlutterSecureStorage secure;

  // ----- Shared Pref -----
  @override
  Future<bool> saveString(String key, String value) =>
      prefs.setString(key, value);

  @override
  String? getString(String key) => prefs.getString(key);

  @override
  Future<bool> saveBool(String key, bool value) => prefs.setBool(key, value);

  @override
  bool? getBool(String key) => prefs.getBool(key);

  @override
  Future<bool> remove(String key) => prefs.remove(key);
  @override
  Future<bool> clear() => prefs.clear();

  // ----- Secure Storage -----
  @override
  Future<void> saveSecure(String key, String value) =>
      secure.write(key: key, value: value);

  @override
  Future<String?> getSecure(String key) => secure.read(key: key);

  @override
  Future<void> removeSecure(String key) => secure.delete(key: key);

  @override
  Future<void> clearSecure() => secure.deleteAll();
}
