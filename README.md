# Storage Wrapper

A wrapper for shared_preferences and flutter_secure_storage that provides an unified api.

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

## More docs:
The package wraps:
* https://pub.dev/packages/flutter_secure_storage
* https://pub.dev/packages/shared_preferences/