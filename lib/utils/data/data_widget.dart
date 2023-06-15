import 'package:flutter/material.dart';
import 'package:ijw_transport_app/utils/ui/loading/circular_progress.dart';
import 'package:ijw_transport_app/utils/utils.dart';

import '../../core/services/event_bus/event_bus.dart';
import '../../core/services/event_bus/events.dart';
import '../../core/services/injection_container.dart';
import 'data_error.dart';

abstract class DataWidget<T extends StatefulWidget> extends State<T> implements EventBusListener {
  bool loaded = false;
  bool loading = true;
  Object? lastError;

  bool get showLoader => loading && !loaded;
  bool get showError => !loading && !loaded && lastError != null;

  Future<void> onLoad();
  Future<void> onRefresh();
  Widget buildWidget(BuildContext context);

  @override
  void initState() {
    super.initState();

    getIt.get<EventBus>().registerListener<PageReloaded>(this);
    () async {
      await load();
    }.withPostFrameCallback();
  }

  @override
  Widget build(BuildContext context) {
    if (showLoader) {
      return buildLoader(context);
    } else if (showError) {
      return buildError(context);
    } else if (!loaded) {
      return const SizedBox.shrink();
    }

    return buildWidget(context);
  }

  Widget buildLoader(BuildContext context) => const Material(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
          child: AppCircularProgressIndicator(),
        ),
      );

  Widget buildError(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        child: DataError(onRetry: refresh),
      );

  void requestRender() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> load() async {
    loading = true;
    requestRender();

    try {
      await onLoad();
      lastError = null;
      loaded = true;
    } catch (e) {
      lastError = e;
      // AppCore.instance.logger
      //     .error("An error occurred while attempting to load data: $e", trace: st);
    }

    loading = false;
    requestRender();
  }

  Future<void> refresh() async {
    loading = true;
    requestRender();

    try {
      await onRefresh();
      lastError = null;
      loaded = true;
    } catch (e) {
      lastError = e;
      // AppCore.instance.logger
      //     .error("An error occurred while attempting to refresh data: $e", trace: st);
    }

    loading = false;
    requestRender();
  }

  @override
  onEvent(event) {
    if (event is PageReloaded) {
      refresh();
    }
  }

  @override
  void dispose() {
    getIt.get<EventBus>().unregisterListener<PageReloaded>(this);
    super.dispose();
  }
}
