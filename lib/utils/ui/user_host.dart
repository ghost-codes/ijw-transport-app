import 'package:flutter/material.dart';

import '../../app/deeplinking/deeplink_handler.dart';
import '../../core/services/event_bus/event_bus.dart';
import '../../core/services/event_bus/events.dart';
import '../../core/services/injection_container.dart';
import '../../router/user_router.dart';
import 'overlay/overlay_manager.dart';

class UserHost extends StatefulWidget {
  static const String name = 'UserHost';

  final ThemeData theme;

  const UserHost({Key? key, required this.theme}) : super(key: key);

  @override
  State<UserHost> createState() => _UserHostState();
}

class _UserHostState extends State<UserHost> {
  @override
  void initState() {
    super.initState();

    getIt.get<EventBus>().emit(RouteChanged(UserHost.name));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Achieve',
      theme: widget.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: userRouter,
      builder: (context, child) => Scaffold(
        body:
            // SecureWidget(
            //   child:
            DeeplinkHandler(
          router: userRouter,
          child: OverlayManager(child: child!),
          // ),
        ),
      ),
    );
  }
}
