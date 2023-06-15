import 'package:flutter/material.dart';

import '../theme/app_text.dart';

class DataError extends StatelessWidget {
  const DataError({Key? key, required this.onRetry}) : super(key: key);

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText.paragraphMedium('Failed to load content'),
          TextButton(
            onPressed: onRetry,
            child: AppText.paragraphRegular('Retry'),
          )
        ],
      ),
    );
  }
}
