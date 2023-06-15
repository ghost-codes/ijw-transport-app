import '../core/services/event_bus/event_bus.dart';
import '../core/services/event_bus/events.dart';
import '../core/services/injection_container.dart';
import '../utils/fcm_helper.dart';

enum AppState {
  maintenance,
  forceUpdate,
  unauthenticated,
  authenticated,
}

class AppStateManager implements EventBusListener {
  bool _initialized = false;

  bool get initialized => _initialized;

  AppState _appState = AppState.unauthenticated;
  AppState get appState => _appState;

  // User? _currentUser;
  // bool get isLoggedIn => _currentUser != null;
  // User get currentUser => _currentUser!;

  late String _appVersionName;
  late String _deviceLocale;
  late String _deviceOS;
  late String _deviceOSVersion;
  late String _currentTimezone;

  late int _currentAppBuildNumber;
  int get appBuildNumber => _currentAppBuildNumber;
  String get appVersionName => _appVersionName;

  AppStateManager() {
    getIt.get<EventBus>().registerListener<AuthStateChanged>(this);
    getIt.get<EventBus>().registerListener<NetworkStateChanged>(this);
    getIt.get<EventBus>().registerListener<UserDataChanged>(this);
  }

  // Future<void> init() async {
  //   if (_initialized) return;

  //   getIt.get<Scheduler>().clear();

  //   try {
  //     await Future.wait([
  //       () async {
  //         var launches = (await _sharedPref.getInt(_AppStateLocalKeys.appLaunches)) ?? 0;
  //         await _sharedPref.putInt(_AppStateLocalKeys.appLaunches, launches + 1);
  //       }(),
  //       _resolveAppInfo(),
  //       _resolveLocale(),
  //       _resolveDeviceInfo(),
  //       _initRemoteConfig(),
  //       FcmHelper.instance.init(),
  //     ]);

  //     _setAppRequestHeaders();

  //     await Future.wait([
  //       _initConfig(),
  //       _initAuth(),
  //     ]);

  //     if (!isLoggedIn) {
  //       await _initGuestSession();
  //     } else {
  //       await _initUserSession();
  //     }

  //     _initialized = true;
  //     getIt<EventBus>().emit(AppStateChanged.changed());
  //   } catch (e, st) {
  //     AppCore.instance.logger.error(e, trace: st);
  //     getIt<EventBus>().emit(AppStateChanged.initializationFailed("An error occurred"));
  //   }
  // }

  // Future<void> setNewSignUp() async {
  //   await _sharedPref.putBool('isNewSignUP', true);
  // }

  // Future<void> removeNewSignUpVal() async {
  //   await _sharedPref.removeKey('isNewSignUP');
  // }

  // Future<void> _initAuth() async {
  //   try {
  //     _currentUser = await getIt.get<AuthRepository>().fetchMe(true);
  //     // Preload important data
  //     await Future.wait([
  //       () async {}(),
  //     ]);

  //     getIt<EventBus>().emit(UserDataChanged(user: _currentUser!));
  //   } on ServerOperationFailure catch (e) {
  //     if (e.message != 'Authentication Required') rethrow;
  //   }
  // }

  // Future<void> refreshUser() async {
  //   if (!isLoggedIn) return;

  //   try {
  //     _currentUser = await getIt.get<AuthRepository>().fetchMe(true);
  //     getIt<EventBus>().emit(UserDataChanged(user: _currentUser!));
  //   } on ServerOperationFailure catch (e) {
  //     if (e.message != 'Authentication Required') rethrow;
  //   }
  // }

  // Future<void> _initUserSession() async {
  //   _appState = AppState.authenticated;

  //   _registerAppSchedules();

  //   FlutterBranchSdk.setIdentity(currentUser.AppId);
  //   FlutterBranchSdk.setIOSSKAdNetworkMaxTime(24);

  //   final token = await FcmHelper.instance.getToken();
  //   if (token != null) await _registerFCMToken(token);
  // }

  // Future<void> _initGuestSession() async {
  //   _appState = AppState.unauthenticated;

  //   await Future.wait([
  //     _clearStores(),
  //     _metricsClient.clearUser(),
  //   ]);

  //   FlutterBranchSdk.logout();
  // }

  // Future<void> _resolveAppInfo() async {
  //   final pkgInfo = await PackageInfo.fromPlatform();
  //   _currentAppBuildNumber = int.parse(pkgInfo.buildNumber);
  //   _appVersionName = _appVersionName = pkgInfo.version;
  // }

  // Future<void> _resolveLocale() async {
  //   final currentTimezone = getTimeZone();
  //   final locale = await Devicelocale.currentLocale;
  //   _deviceLocale = locale ?? 'en_US)';
  //   _currentTimezone = currentTimezone;
  // }

  // Future<void> _resolveDeviceInfo() async {
  //   final deviceInfo = DeviceInfoPlugin();

  //   if (kIsWeb) {
  //     final webBrowserInfo = await deviceInfo.webBrowserInfo;
  //     _deviceOS = 'Web';
  //     _deviceOSVersion = webBrowserInfo.userAgent ?? 'Unknown Web Agent';
  //     return;
  //   }

  //   _deviceOS = Platform.isAndroid ? 'Android' : 'IOS';

  //   if (Platform.isAndroid) {
  //     final androidInfo = await deviceInfo.androidInfo;
  //     _deviceOSVersion = androidInfo.model ?? 'Unknown OS'; // e.g. "Moto G (4)"
  //   } else if (Platform.isIOS) {
  //     final iosInfo = await deviceInfo.iosInfo;
  //     _deviceOSVersion = iosInfo.utsname.machine ?? 'Unknown OS'; // e.g. "iPod7,1"
  //   }
  // }

  // void _setAppRequestHeaders() {
  //   final headers = {
  //     'X-DeviceInfo-Locale': _deviceLocale,
  //     'X-DeviceInfo-Timezone': _currentTimezone,
  //     'X-DeviceInfo-App-Version': _appVersionName,
  //     'X-DeviceInfo-OS': _deviceOS,
  //     'X-DeviceInfo-OSVersion': _deviceOSVersion,
  //   };
  // }

  // Future<bool> get isNotificationEnabled async {
  //   return FcmHelper.instance.isNotificationPermissionGranted();
  // }

  // Future<bool> enablePushNotification() async {
  //   return FcmHelper.instance.requestNotificationPermission();
  // }

  // Future<void> _registerFCMToken(String token) async {
  //   const fcmPushTokenKey = 'fcm_push_token';
  //   final savedToken = await _sharedPref.getString(fcmPushTokenKey);
  //   await _sharedPref.putString(fcmPushTokenKey, token);

  //   Intercom.instance.sendTokenToIntercom(token);

  //   if (!isLoggedIn) return;

  //   try {
  //     await getIt<AuthRepository>().registerDevice(token, previousToken: savedToken);
  //   } catch (e) {
  //     // do nothing
  //   }
  // }

  // void _performVersionCheck() {
  //   if (_config == null) return;

  //   final requiredAppVersion = config.requiredAppVersion;
  //   final latestAppVersion = config.latestAppVersion!;

  //   if (appBuildNumber >= latestAppVersion) return;

  //   if (requiredAppVersion != null && appBuildNumber < requiredAppVersion) {
  //     _appState = AppState.forceUpdate;
  //     getIt<EventBus>().emit(AppStateChanged.changed());
  //     return;
  //   }

  //   if (appBuildNumber < latestAppVersion) {
  //     getIt.get<Scheduler>().scheduleTask(
  //       AppTask.updateAvailable,
  //       [
  //         ScreenIdleConstraint(),
  //         RouteConstraint(name: UserRoutes.home),
  //       ],
  //     );
  //     return;
  //   }
  // }

  // Future<bool> get isFirstLaunch async {
  //   final launches = await _sharedPref.getInt(_AppStateLocalKeys.appLaunches);
  //   return launches == null || launches == 1;
  // }

  // void clearUserData() async {
  //   return await _sharedPref.clear(clearSecure: true);
  // }

  // Future<void> sendEmailFeedback() async {
  //   var msgText = '';

  //   if (isLoggedIn) {
  //     msgText +=
  //         'AppID:     ${currentUser.AppId}\nCustomer:     ${'${currentUser.firstname} ${currentUser.othernames}'}\n';
  //   }

  //   msgText +=
  //       'Platform:     ${Platform.isAndroid ? 'Android' : 'IOS'}\nVersion:     $appVersionName\n--------------------------------------------------------------\n\n'
  //           .trimLeft();

  //   final email = Email(
  //     to: ex.Config.supportEmails,
  //     subject: 'App Feedback',
  //     body: msgText,
  //   );

  //   await EmailLauncher.launch(email);
  // }

  // Future<void> launchReview() async {
  //   final inAppReviewer = InAppReview.instance;
  //   final isAvailable = await inAppReviewer.isAvailable();
  //   if (Platform.isAndroid || !isAvailable) {
  //     inAppReviewer.openStoreListing(appStoreId: '1532635527');
  //     return;
  //   }

  //   return inAppReviewer.requestReview();
  // }

  // // /// [sentiment] is either `positive` or `negative`
  // Future<void> rateApp(String sentiment, {String? feedback}) async {
  //   GraphQLClient gqlClient = AppCore.instance.gqlClient;

  //   try {
  //     await gqlClient.runMutation(RateAppRequest(
  //       sentiment,
  //       feedback: feedback,
  //     ));
  //   } on NetworkError catch (_) {}
  // }

  // Future<void> shareApp() async {
  //   final shareUrl = currentUser.shareUrl;
  //   return Share.share(shareUrl);
  // }

  @override
  Future<void> onEvent(event) async {
    if (event is AuthStateChanged) {
      _initialized = false;
      // _currentUser = null;

      getIt<EventBus>().emit(AppStateChanged.changed());
      if (event.session == null && _appState == AppState.authenticated) {
        _appState = AppState.unauthenticated;
      }
    } else if (event is UserDataChanged) {
      // _currentUser = event.user;
    } else if (event is NetworkStateChanged) {
      switch (event.state) {
        case NetworkState.maintenance:
          _appState = AppState.maintenance;
          getIt.get<EventBus>().emit(AppStateChanged.changed());
          break;
        case NetworkState.authTokenExpired:
          if (appState == AppState.authenticated) logout();
          break;
        default:
      }
    }
  }

  Future<void> logout() async {
    await Future.wait([
      // getIt.get<AuthRepository>().clearStores(),
      FcmHelper.instance.resetInstance(),
    ]);

    getIt.get<EventBus>().emit(AuthStateChanged.loggedOut());
  }

  // Future<void> _clearStores() async {
  //   final Map<String, String?> preserved = {
  //     "referrerId": null,
  //     "affiliateId": null,
  //   };

  //   await Future.wait(
  //     preserved.keys
  //         .map(
  //           (key) => () async {
  //             preserved[key] = await AppCore.instance.sharedPref.getString(key, secure: true);
  //           }(),
  //         )
  //         .toList(),
  //   );

  //   await AppCore.instance.sharedPref.clear(clearSecure: true);

  //   await Future.wait(
  //     preserved.keys
  //         .map(
  //           (key) => () async {
  //             final value = preserved[key];
  //             if (value != null) {
  //               await AppCore.instance.sharedPref.putString(key, value, secure: true);
  //             }
  //           }(),
  //         )
  //         .toList(),
  //   );
  // }
}

class _AppStateLocalKeys {
  static const String appLaunches = 'app_launches';
}
