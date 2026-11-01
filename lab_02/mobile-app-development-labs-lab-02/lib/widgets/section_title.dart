import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Заголовок секції екрана.
class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
