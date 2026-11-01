import 'package:flutter/material.dart';
import 'package:lab_02/data/device.dart';
import 'package:lab_02/theme/app_colors.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Індикатор стану підключення пристрою: кольорова крапка та підпис.
class StatusBadge extends StatelessWidget {
  const StatusBadge({required this.status, super.key});

  final DeviceStatus status;

  @override
  Widget build(BuildContext context) {
    final Color color = status == DeviceStatus.online
        ? AppColors.success
        : AppColors.offline;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: const SizedBox.square(dimension: 10),
        ),
        const SizedBox(width: AppSpacing.xs),
        Flexible(
          child: Text(
            status.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
