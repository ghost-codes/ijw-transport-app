import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:ijw_transport_app/app/app_state_manager.dart';
import 'package:ijw_transport_app/app/deeplinking/deeplink_manager.dart';
import 'package:ijw_transport_app/utils/fcm_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/network_event_listener.dart';
import '../network/rest/apiConstants.dart';
import '../network/rest/rest_client_impl.dart';
import '../preference/shared_pref.dart';
import '../preference/shared_pref_impl.dart';
import 'event_bus/event_bus.dart';

final getIt = GetIt.instance;

Future<void> setupService() async {
  // register EventBus
  getIt.registerSingleton(EventBus());

  /// setup network event listener
  final netEventListener = NetworkEventListener(refreshSession: () async {
    return true;
  });

  final AppRestClient = RestClientImpl(ApiConstants.API_URL, netEventListener.onNetworkError);

  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPref>(() => SharedPrefImpl(
        prefs: sharedPref,
        secureStorage: const FlutterSecureStorage(),
      ));

  getIt.registerLazySingleton(() => AppStateManager());
  getIt.registerLazySingleton(() => DeeplinkManager());
  getIt.registerLazySingleton(() => FcmHelper());
}
