part of 'storage_wrapper.dart';

class _SecureStorage implements StorageWrapper {
  @override
  StorageWrapper get _storage => this;

  @override
  Future<bool> write(
      {@required String key,
      @required String value,
      IOSOptions iOptions,
      AndroidOptions aOptions}) async {
    var storage = FlutterSecureStorage();
    try {
      await storage.write(
        key: key,
        value: value,
        iOptions: iOptions,
        aOptions: aOptions,
      );
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  Future<String> read(
      {String key,
      String value,
      IOSOptions iOptions,
      AndroidOptions aOptions}) {
    var storage = FlutterSecureStorage();
    try {
      return storage.read(
        key: key,
        iOptions: iOptions,
        aOptions: aOptions,
      );
    } on PlatformException catch (_) {
      return null;
    }
  }

  @override
  Future<bool> delete(
      {String key, IOSOptions iOptions, AndroidOptions aOptions}) async {
    final storage = FlutterSecureStorage();
    try {
      await storage.delete(
        key: key,
        iOptions: iOptions,
        aOptions: aOptions,
      );
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> containsKey(
      {String key, IOSOptions iOptions, AndroidOptions aOptions}) async {
    final storage = FlutterSecureStorage();
    return storage.containsKey(key: key);
  }
}
