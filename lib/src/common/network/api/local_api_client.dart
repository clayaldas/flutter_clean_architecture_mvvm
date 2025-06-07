import 'package:safe_extensions/safe_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalApiClient {
  late SharedPreferences _preferences;

  static Future<LocalApiClient> init() async {
    var client = LocalApiClient._();

    // crear una sola instancia de la clase: SharedPreferences 
    // patrón Singleton
    client._preferences = await SharedPreferences.getInstance();
    return client;
  }

  // Constructor privado
  LocalApiClient._();

  Future<bool> setString(String key, {required String value}) async {
    return await _preferences.setString(key, value);
  }

  String getString(String key) {
    return _preferences.getString(key).safeValue;
  }

  Future<bool> setInt(String key, {required int value}) async {
    return await _preferences.setInt(key, value);
  }

  int getInt (String key) {
    return _preferences.getInt(key).safeValue;
  }

  Future<bool> setBool (String key, {required bool value}) async {
    return _preferences.setBool(key, value);
  }

  bool getBool (String key) {
    return _preferences.getBool(key).safeValue;
  }

  Future<void> remove (String key) async {
    await _preferences.remove(key);
  }
}