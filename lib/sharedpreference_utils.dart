/// Author: ramon
/// GitHub: https://github.com/ramoncjj
/// Email: pianduanshouliezhe@gmail.com
/// Date: 2022/12/15
/// Description: sharedpreference_utils

library sharedpreference_utils;

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences Util.
class SharedPreferenceUtil {
  // set int
  static Future setInt({required String key, required int value}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    await v.setInt(key, value);
  }

  // get int
  static Future<int?> getInt({required String key}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    return v.getInt(key);
  }

  // set bool
  static Future setBool({required String key, required bool value}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    await v.setBool(key, value);
  }

  // get bool
  static Future<bool?> getBool({required String key}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    return v.getBool(key);
  }

  // set string
  static Future setString({required String key, required String value}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    await v.setString(key, value);
  }

  // get string
  static Future<String?> getString({required String value}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    return v.getString(value);
  }

  // set double
  static Future setDouble({required String key, required double value}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    await v.setDouble(key, value);
  }

  // get double
  static Future<double?> getDouble({required String key}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    return v.getDouble(key);
  }

  // set string list
  static Future setStringList({required String key, required List<String> value}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    await v.setStringList(key, value);
  }

  // get string list
  static Future<List<String>?> getStringList({required String key}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    return v.getStringList(key);
  }

  // put object.
  static putObject(String key, Object value) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    await v.setString(key, json.encode(value));
  }

  // get object.
  static Future<T?> getObject<T>(
    String key,
    T Function(Map<String, dynamic> v) f,
  ) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    String? _data = v.getString(key);

    Map<String, dynamic>? map = (_data == null || _data.isEmpty) ? null : json.decode(_data);

    return map == null ? null : f(map);
  }

// put object list.
  static putObjectList(String key, List<Object> list) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    List<String>? _dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    await v.setStringList(key, _dataList);
  }

  // get object list.
  static Future<List<T>?> getObjectList<T>(
    String key,
    T Function(Map<String, dynamic> v) f,
  ) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    List<String>? dataLis = v.getStringList(key);
    List<Map<String, dynamic>>? dateListMap = dataLis?.map((value) {
      Map<String, dynamic> _dataMap = json.decode(value);
      return _dataMap;
    }).toList();

    List<T>? list = dateListMap?.map((value1) {
      return f(value1);
    }).toList();

    return list;
  }

  // remove
  static Future remove({required String key}) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    await v.remove(key);
  }

  // have key.
  static Future<bool> haveKey(String key) async {
    SharedPreferences v = await SharedPreferences.getInstance();
    return v.getKeys().contains(key);
  }

  // clear
  static clear() async {
    SharedPreferences v = await SharedPreferences.getInstance();
    await v.clear();
  }
}
