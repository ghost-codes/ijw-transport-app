import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'button.dart';

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton(
    this.text, {
    super.key,
    this.onPressed,
    this.loading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text,
      onPressed: onPressed,
      loading: loading,
      foregroundColor: AppColors.black,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
