# Storage Wrapper

A wrapper for shared_preferences and flutter_secure_storage that provides an unified api and a convenient mocking interface.

## How it works
Calling the `StorageWrapper.common()` constructor will return an instance that saves data in the `SharedPreferences` using the `shared_preferences` plugin.

Calling the `StorageWrapper.secure()` constructor will return an instance that saves data securely using the `flutter_secure_storage` plugin.

Once you got the instance, you can use the methods:
* `write`
* `read`
* `delete`
* `containsKey`

They all take the following parameters:
* `key`: a `String` identifying the key of the value
* `iOptions`: a `IOSOptions` object to specify iOS secure storage accessibility options
* `aOptions`: a `AndroidOptions` object to specify Android secure storage accessibility options

While the `AndroidOptions` do not seem to be used by `flutter_secure_storage`, you can find more information about the `IOSOptions` [here](https://github.com/mogol/flutter_secure_storage/blob/f99c4efbff499a80ad9de08d227d766f832f825a/lib/flutter_secure_storage.dart#L118).

**Note** as for version `1.3.0` you can pass `iOptions` and `aOptions` to the `StorageWrapper.secure()` constructor to avoid passing the same options over and over again.<br>
The options passed to the single methods will override the instance ones, though.

## Mocking values for testing
You can call the `enableMock` method passing an optional `Map<String,String>` for initial values. If nothing is passed, the storage will stay in mocking mode (the `isMocking` will be true) anyway but without any initial data, that will be defaulted to an empty `Map<String,String>`.

The mock data will not be persisted and each instance of `StorageWrapper` will not have the same mock data:

```dart
    final mockWrapper = StorageWrapper.secure();
    mockWrapper.enableMock();

    final mockWrapper2 = StorageWrapper.secure();
    mockWrapper2.enableMock({'foo':'bar'});

    final anotherWrapper = StorageWrapper.secure();

    //mockWrapper and mockWrapper2 will have different data sources
    //anotherWrapper will not be a mock
```

Subsequent calls to `enableMock` will not have any effect.
You can always manipulate the data by accessing the `mockEntries` property.

## More docs:
The package wraps:
* https://pub.dev/packages/flutter_secure_storage
* https://pub.dev/packages/shared_preferences/

## Web support
The package works for Web too.

When using Flutter Web, `CommonStorage` is used for both `common` and `secure` modes.
It's probably because pub.dev does not recognise compatibility with Web because `flutter_secure_storage` is not.