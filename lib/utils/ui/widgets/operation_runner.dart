import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../dialog/dialog_alert.dart';
import '../overlay/overlay_manager.dart';

typedef Operation<T> = Future<T> Function();
typedef OperationFailureHandler = Future<bool> Function(OperationFailure e);

abstract class OperationRunnerState<S extends StatefulWidget> extends State<S>
// with PageWithAnalyticsMixin
{
  @protected
  Future<T?> runOperation<T>(
    String name,
    Operation<T> operation, {
    Map<String, dynamic>? props,
    bool showLoader = true,
    OperationFailureHandler? errorHandler,
  }) async {
    T? result;
    try {
      if (showLoader) OverlayManager.pageBusy();

      // logOperationEvent(name, OperationState.started(props: props));
      result = await operation();
      // logOperationEvent(name, OperationState.success(props: props));
    } catch (e) {
      if (showLoader) OverlayManager.pageIdle();

      var message = "$e";

      if (e is OperationFailure) {
        // logOperationEvent(name, OperationState.failed(e.message, props: props));
        message = e.message;

        if (((await errorHandler?.call(e)) ?? false)) return null;
      }

      if (mounted) await showError(context, message);
    } finally {
      if (showLoader) OverlayManager.pageIdle();
    }

    return result;
  }
}
