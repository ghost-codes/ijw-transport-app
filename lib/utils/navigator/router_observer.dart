import 'package:flutter/material.dart';

import '../../core/services/event_bus/event_bus.dart';
import '../../core/services/event_bus/events.dart';
import '../../core/services/injection_container.dart';

class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    final routeName = route.settings.name;
    getIt.get<EventBus>().emit(RouteChanged(routeName));
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    final routeName = previousRoute?.settings.name;
    getIt.get<EventBus>().emit(RouteChanged(routeName));
  }
}
