import 'package:flutter/material.dart';
import 'package:lab_02/data/device.dart';
import 'package:lab_02/theme/app_spacing.dart';
import 'package:lab_02/widgets/device_card.dart';

/// Адаптивна сітка карток: кількість колонок залежить від доступної ширини.
class DeviceGrid extends StatelessWidget {
  const DeviceGrid({required this.devices, required this.onTap, super.key});

  final List<Device> devices;
  final ValueChanged<Device> onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double extent = constraints.maxWidth >= 720 ? 260 : 220;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: devices.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: extent,
            mainAxisExtent: 172,
            mainAxisSpacing: AppSpacing.m,
            crossAxisSpacing: AppSpacing.m,
          ),
          itemBuilder: (BuildContext context, int index) {
            final Device device = devices[index];
            return DeviceCard(device: device, onTap: () => onTap(device));
          },
        );
      },
    );
  }
}
