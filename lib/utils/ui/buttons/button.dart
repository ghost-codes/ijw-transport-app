import 'package:flutter/material.dart';

import '../../theme/app_text.dart';
import '../../theme/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
    this.text, {
    super.key,
    this.onPressed,
    this.loading = false,
    this.foregroundColor,
    this.backgroundColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColors.black,
          disabledForegroundColor: Colors.grey.shade200,
          backgroundColor: backgroundColor ?? Colors.grey.shade200,
          disabledBackgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: loading
            ? SizedBox(
                width: 31,
                height: 31,
                child: CircularProgressIndicator(
                  color: foregroundColor ?? AppColors.black,
                  backgroundColor: AppColors.black.withOpacity(.2),
                ))
            : AppText.paragraphMedium(text, textColor: foregroundColor),
      ),
    );
  }
}
