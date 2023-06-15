import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref.dart';

class SharedPrefKeys {
  static const String isFirstTime = "isFirstTimeKey";
}

class SharedPrefImpl extends SharedPref {
  SharedPrefImpl({
    required this.prefs,
    required this.secureStorage,
  });

  final SharedPreferences prefs;
  final FlutterSecureStorage secureStorage;

  @override
  Future<void> clear({bool clearSecure = true}) async {
    await prefs.clear();
    if (clearSecure) {
      await secureStorage.deleteAll();
    }
  }

  @override
  Future<void> putInt(String key, int value, {bool secure = false}) async {
    if (!secure) {
      await prefs.setInt(key, value);
    } else {
      await secureStorage.write(key: key, value: value.toString());
    }
  }

  @override
  Future<void> putString(
    String key,
    String value, {
    bool secure = false,
  }) async {
    if (!secure) {
      await prefs.setString(key, value);
    } else {
      await secureStorage.write(key: key, value: value.toString());
    }
  }

  @override
  Future<void> putBool(String key, bool value, {bool secure = false}) async {
    if (!secure) {
      await prefs.setBool(key, value);
    } else {
      await secureStorage.write(key: key, value: value.toString());
    }
  }

  @override
  Future<void> putDouble(
    String key,
    double value, {
    bool secure = false,
  }) async {
    assert(key.trim().isNotEmpty, '`key` cannot be empty');
    if (!secure) {
      await prefs.setDouble(key, value);
    } else {
      await secureStorage.write(key: key, value: value.toString());
    }
  }

  @override
  Future<bool?> getBool(String key, {bool secure = false}) async {
    if (!secure) {
      return prefs.getBool(key);
    } else {
      final result = await secureStorage.read(key: key);
      if (result == null) return null;

      return result.toLowerCase() == 'true';
    }
  }

  @override
  Future<double?> getDouble(String key, {bool secure = false}) async {
    if (!secure) {
      return prefs.getDouble(key);
    } else {
      final result = await secureStorage.read(key: key);
      if (result == null) return null;
      return double.tryParse(result);
    }
  }

  @override
  Future<int?> getInt(String key, {bool secure = false}) async {
    if (!secure) {
      return prefs.getInt(key);
    } else {
      final result = await secureStorage.read(key: key);
      if (result == null) return null;
      return int.tryParse(result);
    }
  }

  @override
  Future<String?> getString(String key, {bool secure = false}) async {
    if (!secure) {
      return prefs.getString(key);
    } else {
      return await secureStorage.read(key: key);
    }
  }

  @override
  Future<void> removeKey(String key, {bool secure = false}) async {
    if (!secure) {
      await prefs.remove(key);
    } else {
      await secureStorage.delete(key: key);
    }
  }
}
