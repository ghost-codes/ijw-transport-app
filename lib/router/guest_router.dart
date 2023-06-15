import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:ijw_transport_app/core/preference/shared_pref.dart';
import 'package:ijw_transport_app/core/preference/shared_pref_impl.dart';
import 'package:ijw_transport_app/core/services/injection_container.dart';
import 'package:ijw_transport_app/ui/guest/onboarding/onboarding.dart';
import 'package:ijw_transport_app/ui/guest/sign_in.dart';
import 'package:ijw_transport_app/utils/navigator/router_observer.dart';

abstract class GuestRoutes {}

final guestRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: "/sign-in",
  observers: [
    RouterObserver(),
  ],
  redirect: (context, state) async {
    final sharedPref = getIt.get<SharedPref>();
    if ((await sharedPref.getBool(SharedPrefKeys.isFirstTime)) ?? true) {
      return "/onboarding";
    }
    return null;
  },
  routes: [
    GoRoute(
      path: "/onboarding",
      builder: (context, state) {
        return const OnboardingPage();
      },
    ),
    GoRoute(
        path: "/sign-in",
        builder: (context, state) {
          return const SignInPage();
        })
  ],
);
