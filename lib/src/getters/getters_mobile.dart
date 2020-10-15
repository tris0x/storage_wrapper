import 'package:storage_wrapper/src/common_storage.dart';
import 'package:storage_wrapper/src/secure_storage.dart';
import 'package:storage_wrapper/src/storage_wrapped.dart';

StorageWrapped getCommonStorage() => CommonStorage();
StorageWrapped getSecureStorage() => SecureStorage();
