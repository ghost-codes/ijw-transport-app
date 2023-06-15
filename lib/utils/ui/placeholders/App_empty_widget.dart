import 'package:flutter/material.dart';

import '../../theme/app_text.dart';
import '../../theme/colors.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        alignment: Alignment.center,
        color: AppColors.offWhite,
        // useBorder: false,
        child: AppText.paragraphRegular(message, textAlign: TextAlign.center),
      ),
    );
  }
}
