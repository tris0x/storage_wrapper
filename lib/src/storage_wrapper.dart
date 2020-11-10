import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage_wrapper/src/storage_wrapped.dart';

import 'getters/getters_stub.dart'
    if (dart.library.io) 'getters/getters_mobile.dart'
    if (dart.library.js) 'getters/getters_web.dart';

class StorageWrapper {
  Map<String, String> _mockEntries;
  Map<String, String> get mockEntries => _mockEntries;

  final StorageWrapped _storage;
  final AndroidOptions _androidOptions;
  final IOSOptions _iosOptions;

  ///Creates an instance of a secure local storage manager. Returns a common storage on Web.
  StorageWrapper.secure({AndroidOptions aOptions, IOSOptions iOptions})
      : _storage = getSecureStorage(),
        _androidOptions = aOptions,
        _iosOptions = iOptions;

  ///Creates an instance of a local storage manager. Returns a common storage on Web.
  StorageWrapper.common()
      : _storage = getCommonStorage(),
        _androidOptions = null,
        _iosOptions = null;

  ///Set mock data for testing purposes
  ///Subsequent calls to this method will not have any effect
  void enableMock({Map<String, String> initialData}) {
    _mockEntries ??= initialData ?? {};
  }

  ///If [mockEntries] is not null it means the storage behavior is being mocked.
  bool get isMocking => mockEntries != null;

  ///Write the [value] for the corresponding [key].
  ///Overwrites it if it already exists.
  ///For secure storage, [iOptions] and [aOptions] allow more control on the data access policy.
  Future<bool> write(
      {@required String key,
      @required String value,
      IOSOptions iOptions,
      AndroidOptions aOptions}) async {
    if (isMocking) {
      mockEntries[key] = value;
      return true;
    }
    return _storage.write(
      key: key,
      value: value,
      iOptions: iOptions ?? _iosOptions,
      aOptions: aOptions ?? _androidOptions,
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
    if (isMocking) {
      return mockEntries[key];
    }
    return _storage.read(
      key: key,
      iOptions: iOptions ?? _iosOptions,
      aOptions: aOptions ?? _androidOptions,
    );
  }

  ///Deletes the value corresponding to the [key].
  ///For secure storage, [iOptions] and [aOptions] allow more control on the data access policy.
  Future<bool> delete({
    @required String key,
    IOSOptions iOptions,
    AndroidOptions aOptions,
  }) async {
    if (isMocking) {
      mockEntries.remove(key);
      return true;
    }
    return _storage.delete(
      key: key,
      iOptions: iOptions ?? _iosOptions,
      aOptions: aOptions ?? _androidOptions,
    );
  }

  ///Returns [true] if the [key] has a corresponding value, [false] otherwise.
  ///For secure storage, [iOptions] and [aOptions] allow more control on the data access policy.
  Future<bool> containsKey(
      {String key, IOSOptions iOptions, AndroidOptions aOptions}) async {
    if (isMocking) {
      return mockEntries.containsKey(key);
    }
    return _storage.containsKey(
      key: key,
      iOptions: iOptions ?? _iosOptions,
      aOptions: aOptions ?? _androidOptions,
    );
  }
}
