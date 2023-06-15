import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/colors.dart';

class SvgButton extends StatelessWidget {
  const SvgButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.bgColor,
    this.width = 25,
  });

  final String icon;
  final double width;
  final Color? color;
  final Color? bgColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: Container(
          width: width + 10,
          height: width + 10,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: bgColor ?? AppColors.offWhite.withOpacity(0.2),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: width,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
