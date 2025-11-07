abstract class AppStorage {
  // Shared Pref
  Future<bool> saveString(String key, String value);
  String? getString(String key);
  // ignore: avoid_positional_boolean_parameters
  Future<bool> saveBool(String key, bool value);
  bool? getBool(String key);
  Future<bool> remove(String key);
  Future<bool> clear();
  // Secure Storage
  Future<void> saveSecure(String key, String value);
  Future<String?> getSecure(String key);
  Future<void> removeSecure(String key);
  Future<void> clearSecure();
}
