import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage_wrapper/src/storage_wrapped.dart';
import 'package:storage_wrapper/storage_wrapper.dart';

class SecureStorage implements StorageWrapped {
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

  @override
  Future<bool> deleteAll({IOSOptions iOptions, AndroidOptions aOptions}) async {
    final storage = FlutterSecureStorage();
    try {
      await storage.deleteAll(
        iOptions: iOptions,
        aOptions: aOptions,
      );
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> getAll(
      {IOSOptions iOptions, AndroidOptions aOptions}) async {
    final storage = FlutterSecureStorage();
    try {
      final result = await storage.readAll(
        iOptions: iOptions,
        aOptions: aOptions,
      );
      return result;
    } on PlatformException catch (_) {
      return {};
    }
  }
}
