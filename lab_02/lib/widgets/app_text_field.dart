import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Текстове поле з іконкою та уніфікованим відступом знизу.
class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    required this.icon,
    this.keyboardType,
    super.key,
  });

  final String label;
  final IconData icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.m),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
