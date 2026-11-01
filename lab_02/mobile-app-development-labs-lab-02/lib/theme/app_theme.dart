import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_colors.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Будує єдину тему застосунку.
ThemeData buildAppTheme() {
  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSpacing.radius),
  );

  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: border,
      filled: true,
      fillColor: AppColors.surface,
    ),
  );
}
