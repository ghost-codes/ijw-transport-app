import 'dart:async';

abstract class SharedPref {
  Future<void> putString(String key, String value, {bool secure = false});

  Future<void> putInt(String key, int value, {bool secure = false});

  Future<void> putBool(String key, bool value, {bool secure = false});

  Future<void> putDouble(String key, double value, {bool secure = false});

  Future<String?> getString(String key, {bool secure = false});

  Future<int?> getInt(String key, {bool secure = false});

  FutureOr<bool?> getBool(String key, {bool secure = false});

  Future<double?> getDouble(String key, {bool secure = false});

  Future<void> clear({bool clearSecure = true});

  Future<void> removeKey(String key, {bool secure = false});
}
