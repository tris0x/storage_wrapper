import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_wrapper/storage_wrapper.dart';

class CommonStorage implements StorageWrapper {
  @override
  Future<bool> write(
      {@required String key,
      @required String value,
      IOSOptions iOptions,
      AndroidOptions aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  @override
  Future<String> read(
      {String key,
      String value,
      IOSOptions iOptions,
      AndroidOptions aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<bool> delete(
      {String key, IOSOptions iOptions, AndroidOptions aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  @override
  Future<bool> containsKey(
      {String key, IOSOptions iOptions, AndroidOptions aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
