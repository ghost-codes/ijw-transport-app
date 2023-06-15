import 'package:flutter/material.dart';
import 'package:ijw_transport_app/utils/ui/widgets/operation_runner.dart';
import 'package:ijw_transport_app/utils/utils.dart';

import '../../core/services/event_bus/event_bus.dart';
import '../../core/services/event_bus/events.dart';
import '../../core/services/injection_container.dart';

class SplashHost extends StatefulWidget {
  static const String name = 'SplashHost';
  const SplashHost({Key? key}) : super(key: key);

  @override
  State<SplashHost> createState() => _SplashHostState();
}

class _SplashHostState extends OperationRunnerState<SplashHost> implements EventBusListener {
  @override
  void initState() {
    super.initState();

    getIt.get<EventBus>().emit(RouteChanged(SplashHost.name));
    getIt.get<EventBus>().registerListener<AppStateChanged>(this);

    () async {
      // _config ??= await _appStateManager.getConfig();
      _initialize();
    }.withPostFrameCallback();
  }

  Future<void> _initialize() async {
    // _lastAppInitialization = null;
    // _appStateManager.init();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void onEvent(dynamic event) {
    if (event is AppStateChanged) {
      setState(() {
        // _lastAppInitialization = event;
      });
    }
  }

  @override
  void dispose() {
    getIt.get<EventBus>().unregisterListener<AppStateChanged>(this);
    // _controller.dispose();
    super.dispose();
  }

  @override
  String get pageName => 'Splash Screen';
}
