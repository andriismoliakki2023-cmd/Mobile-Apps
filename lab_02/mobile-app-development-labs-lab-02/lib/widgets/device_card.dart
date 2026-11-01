import 'package:flutter/material.dart';
import 'package:lab_02/data/device.dart';
import 'package:lab_02/theme/app_spacing.dart';
import 'package:lab_02/widgets/app_card.dart';
import 'package:lab_02/widgets/icon_avatar.dart';
import 'package:lab_02/widgets/status_badge.dart';

/// Картка IoT-пристрою для сітки на головному екрані.
class DeviceCard extends StatelessWidget {
  const DeviceCard({required this.device, required this.onTap, super.key});

  final Device device;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;

    return AppCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconAvatar(icon: device.icon),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: StatusBadge(status: device.status),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              device.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text.titleSmall,
            ),
            Text(
              device.room,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text.bodySmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              device.value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
