import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RefreshWrapper extends StatelessWidget {
  final Widget body;
  final Future Function() onRefresh;
  final EdgeInsets? padding;

  final ScrollController? controller;

  const RefreshWrapper({
    super.key,
    required this.onRefresh,
    required this.body,
    this.padding,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !Platform.isIOS) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: Scrollbar(
          controller: controller,
          child: SingleChildScrollView(
            controller: controller,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: padding,
            child: body,
          ),
        ),
      );
    }

    return CupertinoScrollbar(
      controller: controller,
      child: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: padding,
              primary: false,
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
