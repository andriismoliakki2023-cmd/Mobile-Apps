import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_colors.dart';

/// Рядок «іконка – підпис – значення» для карток з інформацією.
class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
