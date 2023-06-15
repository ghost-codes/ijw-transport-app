import 'package:flutter/material.dart';
import 'package:ijw_transport_app/utils/theme/app_typography.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.onPressed,
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final Color backgroundColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      if (states.any((e) => e == MaterialState.disabled)) {
        // return AppColors.grey2.withOpacity(0.8);
        return Colors.grey.withOpacity(0.8);
      }

      return backgroundColor;
    }

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(getColor),
        ),
        child: Text(
          label,
          style: AppTypography.descriptionBold(textColor: labelColor),
        ),
      ),
    );
  }
}
