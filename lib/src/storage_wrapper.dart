import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'getters/getters_stub.dart'
    if (dart.library.io) 'getters/getters_mobile.dart'
    if (dart.library.js) 'getters/getters_web.dart';

class StorageWrapper {
  final StorageWrapper _storage;

  StorageWrapper._default() : _storage = getCommonStorage();

  ///Creates an instance of a secure local storage manager. Returns a common storage on Web.
  StorageWrapper.secure() : _storage = getSecureStorage();

  ///Creates an instance of a local storage manager. Returns a common storage on Web.
  factory StorageWrapper.common() => StorageWrapper._default();

  ///Write the [value] for the corresponding [key].
  ///Overwrites it if it already exists.
  ///For secure storage, [iOptions] and [aOptions] allow more control on the data access policy.
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

  ///Read the value corresponding to the [key].
  ///Returns null for non existing values.
  ///For secure storage, [iOptions] and [aOptions] allow more control on the data access policy.
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

  ///Deletes the value corresponding to the [key].
  ///For secure storage, [iOptions] and [aOptions] allow more control on the data access policy.
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

  ///Returns [true] if the [key] has a corresponding value, [false] otherwise.
  ///For secure storage, [iOptions] and [aOptions] allow more control on the data access policy.
  Future<bool> containsKey(
      {String key, IOSOptions iOptions, AndroidOptions aOptions}) {
    return _storage.containsKey(
      key: key,
      iOptions: iOptions,
      aOptions: aOptions,
    );
  }
}
