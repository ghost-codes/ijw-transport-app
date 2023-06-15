import 'package:flutter/material.dart';
import 'package:ijw_transport_app/utils/theme/colors.dart';

class LoadingAnimator {
  final AnimationController controller;

  LoadingAnimator(this.controller)
      : logoYTransition = Tween<Offset>(
          begin: const Offset(0.0, 1),
          end: const Offset(0.0, 0.0),
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.fastOutSlowIn,
        )),
        colorTransition = ColorTween(
          begin: AppColors.offWhite,
          end: AppColors.primary,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.fastOutSlowIn,
        ));

  final Animation<Offset> logoYTransition;
  final Animation<Color?> colorTransition;
}
