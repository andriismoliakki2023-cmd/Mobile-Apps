import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_colors.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Єдина картка застосунку з рамкою та опційною реакцією на дотик.
class AppCard extends StatelessWidget {
  const AppCard({required this.child, this.onTap, super.key});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: AppColors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radius),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(onTap: onTap, child: child),
    );
  }
}
