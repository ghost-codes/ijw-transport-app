import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijw_transport_app/utils/theme/theme.dart';
import 'package:ijw_transport_app/utils/ui/guest_host.dart';
import 'package:ijw_transport_app/utils/ui/maintenance_host.dart';
import 'package:ijw_transport_app/utils/ui/user_host.dart';

import 'app/app_state_manager.dart';
import 'core/services/event_bus/event_bus.dart';
import 'core/services/event_bus/events.dart';
import 'core/services/injection_container.dart';
import 'utils/fcm_helper.dart';
import 'utils/theme/colors.dart';
import 'utils/ui/overlay/overlay_manager.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _App(
      theme: theme,
    );
  }
}

class _App extends StatefulWidget {
  const _App({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  State<_App> createState() => __AppState();
}

class __AppState extends State<_App> implements EventBusListener {
  bool initialized = true;
  final AppStateManager _appStateManager = getIt.get<AppStateManager>();
  late StreamSubscription<RemoteMessage> fcmMessageSub;

  @override
  void initState() {
    super.initState();
    getIt.get<EventBus>().registerListener<AppStateChanged>(this);

    initialize();
  }

  Future<void> initialize() async {
    getIt.get<EventBus>().emit(RouteChanged('Initializer'));

    // await widget.initializer;

    fcmMessageSub = FcmHelper.instance.onMessage.listen(
      (message) {
        FcmHelper.instance.showNotification(message);
      },
    );

    setState(() => initialized = true);
  }

  Widget _wrapper(String key, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MaterialApp(
        key: ValueKey(key),
        home: OverlayManager(child: child),
        title: 'Title',
        theme: widget.theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      return _wrapper(
        'Initializer',
        Scaffold(
          body: Container(
            color: AppColors.primary,
          ),
        ),
      );
    }
    print("object");

    final appState = _appStateManager.appState;

    if (appState == AppState.maintenance) {
      return _wrapper('Maintenance', const MaintenanceHost());
    }

    // if (!_appStateManager.initialized) {
    //   return _wrapper(
    //     'Splash',
    //     const SplashHost(),
    //   );
    // }

    switch (appState) {
      // case AppState.forceUpdate:
      // return _wrapper('ForceUpdate', const ForceUpdateHost());
      case AppState.authenticated:
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: UserHost(
            theme: widget.theme,
            key: const ValueKey('Authenticated'),
          ),
        );
      case AppState.unauthenticated:
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: GuestHost(
            theme: widget.theme,
            key: const ValueKey('Guest'),
          ),
        );
      default:
        throw Exception("Unhandled app state: $appState");
    }
  }

  @override
  void dispose() {
    getIt.get<EventBus>().unregisterListener<AppStateChanged>(this);
    fcmMessageSub.cancel();
    super.dispose();
  }

  @override
  void onEvent(event) {
    setState(() {});
  }
}
