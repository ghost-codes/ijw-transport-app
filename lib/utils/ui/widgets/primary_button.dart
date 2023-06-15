import 'package:flutter/material.dart';
import 'package:ijw_transport_app/utils/theme/app_typography.dart';

import '../../theme/colors.dart';
import 'base_button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
    this.label, {
    Key? key,
    required this.onPressed,
    this.color = AppColors.primary,
    this.disabled = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool disabled;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      label: label,
      backgroundColor: disabled ? Colors.grey.withOpacity(0.8) : color,
      // backgroundColor: disabled ? AppColors.grey2.withOpacity(0.8) : color,
      labelColor: AppColors.white,
    );
  }
}

class OutlinedWashButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? borderColor;
  final Color? textColor;

  const OutlinedWashButton({
    super.key,
    this.onPressed,
    required this.label,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const color = Color(0xffD6D6D6);

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: onPressed != null ? (borderColor ?? AppColors.primary) : color),
          ),
        ),
        child: Text(label,
            style: AppTypography.paragraphBold(
              textColor: onPressed == null ? color : (textColor ?? AppColors.primary),
            )),
      ),
    );
  }
}
