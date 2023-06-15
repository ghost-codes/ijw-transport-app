import 'package:flutter/material.dart';

import '../../app/deeplinking/deeplink_handler.dart';
import '../../core/services/event_bus/event_bus.dart';
import '../../core/services/event_bus/events.dart';
import '../../core/services/injection_container.dart';
import '../../router/guest_router.dart';
import 'overlay/overlay_manager.dart';

class GuestHost extends StatefulWidget {
  static const String name = 'GuestHost';

  final ThemeData theme;

  const GuestHost({Key? key, required this.theme}) : super(key: key);

  @override
  State<GuestHost> createState() => _GuestHostState();
}

class _GuestHostState extends State<GuestHost> {
  @override
  void initState() {
    super.initState();

    getIt.get<EventBus>().emit(RouteChanged(GuestHost.name));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Achieve',
      theme: widget.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: guestRouter,
      builder: (context, child) => DeeplinkHandler(
        router: guestRouter,
        child: OverlayManager(child: child!),
      ),
    );
  }
}
