import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'common_storage.dart';
part 'secure_storage.dart';

class LocalStorage {
  final LocalStorage _storage;

  LocalStorage._default() : _storage = _CommonStorage();

  LocalStorage.secure()
      : _storage = kIsWeb ? _CommonStorage() : _SecureStorage();

  factory LocalStorage.common() => LocalStorage._default();

  Future<bool> write(
      {@required String key,
      @required String value,
      IOSOptions iOptions,
      AndroidOptions aOptions}) async {
    return _storage.write(
      key: key,
      value: value,
      iOptions: iOptions,
      aOptions: aOptions,
    );
  }

  Future<String> read({
    @required String key,
    IOSOptions iOptions,
    AndroidOptions aOptions,
  }) async {
    return _storage.read(
      key: key,
      iOptions: iOptions,
      aOptions: aOptions,
    );
  }

  Future<bool> delete({
    @required String key,
    IOSOptions iOptions,
    AndroidOptions aOptions,
  }) async {
    return _storage.delete(
      key: key,
      iOptions: iOptions,
      aOptions: aOptions,
    );
  }

  Future<bool> containsKey(
      {String key, IOSOptions iOptions, AndroidOptions aOptions}) {
    return _storage.containsKey(
      key: key,
      iOptions: iOptions,
      aOptions: aOptions,
    );
  }
}
