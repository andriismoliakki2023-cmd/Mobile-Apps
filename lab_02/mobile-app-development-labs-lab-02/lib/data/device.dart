import 'package:flutter/material.dart';

/// Стан підключення пристрою.
enum DeviceStatus {
  online('Онлайн'),
  offline('Офлайн');

  const DeviceStatus(this.label);

  final String label;
}

/// Модель IoT-пристрою (статична заглушка).
class Device {
  const Device({
    required this.id,
    required this.name,
    required this.room,
    required this.icon,
    required this.value,
    required this.status,
    required this.updated,
  });

  final String id;
  final String name;
  final String room;
  final IconData icon;
  final String value;
  final DeviceStatus status;
  final String updated;
}
