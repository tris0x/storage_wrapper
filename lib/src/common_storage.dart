import 'package:storage_wrapper/src/storage_wrapped.dart';
import 'package:storage_wrapper/storage_wrapper.dart';

class CommonStorage implements StorageWrapped {
  @override
  Future<bool> write(
      {required String key,
      required String value,
      IOSOptions? iOptions,
      AndroidOptions? aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  @override
  Future<String?> read(
      {required String key,
      IOSOptions? iOptions,
      AndroidOptions? aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<bool> delete(
      {required String key,
      IOSOptions? iOptions,
      AndroidOptions? aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  @override
  Future<bool> containsKey(
      {required String key,
      IOSOptions? iOptions,
      AndroidOptions? aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  @override
  Future<bool> deleteAll(
      {IOSOptions? iOptions, AndroidOptions? aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  @override
  Future<Map<String, dynamic>> getAll(
      {IOSOptions? iOptions, AndroidOptions? aOptions}) async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    return {
      for (final key in keys) key: prefs.get(key),
    };
  }
}
