import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {

  static SharedPreferences? sharedPreferences;

  static Future<SharedPreferences> get _instance async =>
      sharedPreferences ??= await SharedPreferences.getInstance();

  static Future<void> init() async{
    await _instance;
  }

  static String? getStringValue({required String key}){
    String? value;
    try {
      value = sharedPreferences?.getString(key);
    }
    catch(e){
      value = null;
    }
    return value;
  }

  static bool? getBooleanValue({required String key}){
    bool? value;
    try {
      value = sharedPreferences?.getBool(key);
    }
    catch(e){
      value = null;
    }
    return value;
  }

  static int? getIntegerValue({required String key}){
    int? value;
    try{
      value = sharedPreferences?.getInt(key);
    }
    catch(e){
      value = null;
    }
    return value;
  }

  static double? getDoubleValue({required String key}){
    double? value;
    try {
      value = sharedPreferences?.getDouble(key);
    }
    catch(e){
      value = null;
    }
    return value;
  }

  static insertValue({required String key, required dynamic value}){
    switch(value.runtimeType) {
      case String: sharedPreferences?.setString(key, value);
      break;
      case bool: sharedPreferences?.setBool(key, value);
      break;
      case int: sharedPreferences?.setInt(key, value);
      break;
      case double: sharedPreferences?.setDouble(key, value);
      break;
    }
  }

  static clearPreferences(){
    sharedPreferences?.clear();
  }

}