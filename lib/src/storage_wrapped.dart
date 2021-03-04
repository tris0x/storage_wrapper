import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageWrapped {
  Future<bool> write({
    required String key,
    required String value,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
  });

  Future<String?> read({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
  });
  Future<bool> delete({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
  });
  Future<bool> containsKey({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
  });

  Future<bool> deleteAll({
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
  });

  Future<Map<String, dynamic>> getAll({
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
  });
}
