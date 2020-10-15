import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageWrapped {
  Future<bool> write({
    @required String key,
    @required String value,
    IOSOptions iOptions,
    AndroidOptions aOptions,
  });

  Future<String> read({
    String key,
    String value,
    IOSOptions iOptions,
    AndroidOptions aOptions,
  });
  Future<bool> delete({
    String key,
    IOSOptions iOptions,
    AndroidOptions aOptions,
  });
  Future<bool> containsKey({
    String key,
    IOSOptions iOptions,
    AndroidOptions aOptions,
  });
}
