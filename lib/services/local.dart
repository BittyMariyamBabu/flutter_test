import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test_app/constants/strings.dart';

class LocalService {
  // SecureStorage instance (singleton)
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static bool alreadyLoggedIn = false;
  static String? accessToken;
  static String? refreshToken;

  /// Initialize secure storage and load login data
  static Future<void> init() async {
    await getLoginData();
  }

  /// Save login data securely
  static Future<void> setLoginData({
    required String kAccessToken,
    required String kRefreshToken,
  }) async {
    accessToken = kAccessToken;
    refreshToken = kRefreshToken;

    await _secureStorage.write(key: AppStrings.keyLoggedIn, value: 'true');
    await _secureStorage.write(key: AppStrings.keyAccessToken, value: kAccessToken);
    await _secureStorage.write(key: AppStrings.keyRefreshToken, value: kRefreshToken);
    alreadyLoggedIn = true;
  }

  /// Retrieve login data securely
  static Future<void> getLoginData() async {
    String? loggedIn = await _secureStorage.read(key: AppStrings.keyLoggedIn);
    accessToken = await _secureStorage.read(key: AppStrings.keyAccessToken);
    refreshToken = await _secureStorage.read(key: AppStrings.keyRefreshToken);
    alreadyLoggedIn = loggedIn == 'true';
  }

  /// Clear all stored login data securely
  static Future<void> removeLoginData() async {
    await _secureStorage.delete(key: AppStrings.keyLoggedIn);
    await _secureStorage.delete(key: AppStrings.keyAccessToken);
    await _secureStorage.delete(key: AppStrings.keyRefreshToken);

    alreadyLoggedIn = false;
    accessToken = null;
    refreshToken = null;
  }
}

