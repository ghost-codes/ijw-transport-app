import 'package:flutter/material.dart';

import '../../theme/app_text.dart';
import '../../theme/colors.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
    this.text, {
    super.key,
    this.onPressed,
    this.loading = false,
    this.color,
    this.textColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        onPressed == null ? Colors.grey.shade600 : textColor ?? AppColors.primary;
    // onPressed == null ? Colors.grey.shade600 : textColor ?? AppColors.primary;
    final backgroundColor = color ?? Theme.of(context).scaffoldBackgroundColor;
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          disabledForegroundColor: Colors.grey.shade200,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: AppColors.primary)),
        ),
        child: loading
            ? SizedBox(
                width: 31,
                height: 31,
                child: CircularProgressIndicator(
                  color: onPressed == null ? Colors.grey.shade600 : textColor ?? AppColors.primary,
                  backgroundColor: AppColors.black.withOpacity(.2),
                ))
            : AppText.paragraphMedium(text, textColor: foregroundColor),
      ),
    );
  }
}
