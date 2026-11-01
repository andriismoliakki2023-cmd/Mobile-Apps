import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_colors.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Шапка профілю: аватар з ініціалами, ім'я та електронна пошта.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.name, required this.email, super.key});

  final String name;
  final String email;

  String get _initials => name
      .split(' ')
      .where((String part) => part.isNotEmpty)
      .take(2)
      .map((String part) => part.substring(0, 1))
      .join();

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 44,
          backgroundColor: AppColors.primary,
          child: Text(
            _initials,
            style: text.headlineMedium?.copyWith(color: AppColors.surface),
          ),
        ),
        const SizedBox(height: AppSpacing.m),
        Text(name, textAlign: TextAlign.center, style: text.headlineSmall),
        Text(
          email,
          textAlign: TextAlign.center,
          style: text.bodyMedium?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
