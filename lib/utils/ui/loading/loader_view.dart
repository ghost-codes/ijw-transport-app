import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ijw_transport_app/utils/theme/colors.dart';
import 'package:ijw_transport_app/utils/ui/loading/circular_progress.dart';
import 'package:ijw_transport_app/utils/utils.dart';

import 'logo_animator.dart';

class LoaderView extends StatefulWidget {
  final AnimationController controller;
  final String? message;

  const LoaderView({
    Key? key,
    required this.controller,
    this.message,
  }) : super(key: key);

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView> with SingleTickerProviderStateMixin {
  AnimationController get controller => widget.controller;

  late AnimationController _loadingAnimation;

  late Animation<double> blurValue = Tween(
    begin: 0.0,
    end: 8.0,
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.decelerate,
  ));

  @override
  void initState() {
    super.initState();

    _loadingAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    () {
      controller.forward();
    }.withPostFrameCallback();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurValue.value,
              sigmaY: blurValue.value,
            ),
            child: child,
          );
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(34),
                constraints: const BoxConstraints(minWidth: 200),
                child: Column(
                  children: [
                    _AchieveLogoAnim(
                      controller: _loadingAnimation,
                      size: 70,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      widget.message ?? 'Please wait ...',
                      style: themeData.textTheme.titleMedium!.copyWith(
                        color: AppColors.black,
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loadingAnimation.dispose();
    super.dispose();
  }
}

class _AchieveLogoAnim extends StatefulHookWidget {
  final double size;
  final AnimationController controller;

  const _AchieveLogoAnim({
    Key? key,
    required this.controller,
    this.size = 90,
  }) : super(key: key);

  @override
  __AchieveLogoAnimState createState() => __AchieveLogoAnimState();
}

class __AchieveLogoAnimState extends State<_AchieveLogoAnim> {
  late final LoadingAnimator _loadingAnimator = LoadingAnimator(widget.controller);

  @override
  void initState() {
    super.initState();
    _loadingAnimator.controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: SizedBox(
                width: size * 0.889,
                height: size * 0.889,
                child: CircularProgressIndicator(
                  valueColor: _loadingAnimator.colorTransition,
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: ValueListenableBuilder<double>(
                valueListenable: _loadingAnimator.controller,
                builder: (context, value, child) {
                  final val = value;
                  final iconSize = size * 0.556;

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (widget, anim) {
                      return ScaleTransition(
                        scale: anim,
                        child: widget,
                      );
                    },
                    child: val >= 0.525
                        ? SizedBox(
                            key: const ValueKey(true),
                            width: iconSize,
                            child: Image.asset('assets/img/achieve_tick.png'),
                          )
                        : SizedBox(
                            key: const ValueKey(false),
                            width: iconSize,
                            child: Image.asset('assets/img/achieve_tick_grey.png'),
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AchieveCircularProgress extends HookWidget {
  final double size;

  const AchieveCircularProgress({
    Key? key,
    this.size = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final animationController = useAnimationController(duration: const Duration(seconds: 2));

    return const AppCircularProgressIndicator();

    //  _AchieveLogoAnim(
    //   controller: animationController,
    //   size: size,
    // );
  }
}
