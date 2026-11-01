import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_colors.dart';

/// Кругла аватарка з іконкою (для пристроїв).
class IconAvatar extends StatelessWidget {
  const IconAvatar({required this.icon, this.radius = 20, super.key});

  final IconData icon;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primaryLight,
      child: Icon(icon, size: radius, color: AppColors.primary),
    );
  }
}
