import 'package:shared_preferences/shared_preferences.dart';

class SettingsService{
  static SharedPreferences? _preferences;
  static init()async{
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveSettings(
    {
      required String key,
      required dynamic value,
    }
  ){
    if(value is String) {
      return _preferences!.setString(key, value);
    } else if(value is bool) {
      return _preferences!.setBool(key, value);
    } else if(value is int) {
      return _preferences!.setInt(key, value);
    } else {
      return _preferences!.setDouble(key, value);
    }
  }

  static String getLanguage({required String key}) {
    return _preferences!.getString(key) ?? 'en';
  }

  static bool isOnBordingFinished({required String key}) {
    return _preferences!.getBool(key) ?? false;
  }
  static String? getToken({required String key}) {
    return _preferences!.getString(key);
  }

    static Future<bool> deleteData(
    {
      required String key,
    }
  ){
      return _preferences!.remove(key);
  }
}