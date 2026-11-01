import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Основна кнопка дії на всю доступну ширину.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
