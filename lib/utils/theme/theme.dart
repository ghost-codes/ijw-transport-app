import 'package:flutter/material.dart';

import 'colors.dart';

final theme = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  textTheme: const TextTheme().apply(fontFamily: "Satoshi"),
);
