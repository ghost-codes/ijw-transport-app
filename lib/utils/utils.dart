import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;

  Timer? _timer;

  Debouncer({this.milliseconds = 500});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

materialRoute(Widget page, {required String routeName, arguments}) {
  return MaterialPageRoute(
    builder: (_) => page,
    settings: RouteSettings(
      name: routeName,
      arguments: arguments,
    ),
  );
}

extension PostFrameCallback on VoidCallback {
  void withPostFrameCallback() => WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          this();
        },
      );
}

String uriEncodeMap(Map data) {
  return data.keys
      .map((key) =>
          "${Uri.encodeComponent(key)}=${data[key] == null ? null : Uri.encodeComponent(data[key].toString())}")
      .join("&");
}
