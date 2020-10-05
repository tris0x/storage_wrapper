part of 'local_storage.dart';

class _CommonStorage implements LocalStorage {
  @override
  LocalStorage get _storage => this;

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
