import 'dart:ui';

import 'package:flutter/material.dart';

class DialogTemplate extends StatelessWidget {
  final Widget? child;
  final Widget Function(Widget child)? parent;

  const DialogTemplate({
    Key? key,
    this.child,
    this.parent,
  })  : assert((child == null) != (parent == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainChill = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Center(
        child: IntrinsicWidth(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 400),
            child: Container(
              margin: const EdgeInsets.all(21),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );

    if (parent != null) {
      return parent!(mainChill);
    }

    return mainChill;
  }
}
