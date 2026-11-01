import 'package:flutter/material.dart';
import 'package:lab_02/data/device.dart';
import 'package:lab_02/theme/app_spacing.dart';
import 'package:lab_02/widgets/content_wrapper.dart';
import 'package:lab_02/widgets/icon_avatar.dart';
import 'package:lab_02/widgets/info_card.dart';
import 'package:lab_02/widgets/info_tile.dart';
import 'package:lab_02/widgets/status_badge.dart';

/// Екран з детальною інформацією про обраний пристрій.
class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({required this.device, super.key});

  final Device device;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(device.name)),
      body: SingleChildScrollView(
        child: ContentWrapper(
          maxWidth: AppSpacing.maxFormWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: IconAvatar(icon: device.icon, radius: 40)),
              const SizedBox(height: AppSpacing.m),
              Text(
                device.value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.s),
              Center(child: StatusBadge(status: device.status)),
              const SizedBox(height: AppSpacing.l),
              InfoCard(
                tiles: <InfoTile>[
                  InfoTile(
                    icon: Icons.meeting_room_outlined,
                    label: 'Кімната',
                    value: device.room,
                  ),
                  InfoTile(
                    icon: Icons.sync,
                    label: 'Останнє оновлення',
                    value: device.updated,
                  ),
                  InfoTile(
                    icon: Icons.tag,
                    label: 'Ідентифікатор',
                    value: device.id,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
