import 'package:flutter/material.dart';
import 'package:lab_02/data/device.dart';
import 'package:lab_02/data/summary_item.dart';
import 'package:lab_02/data/user_profile.dart';

const UserProfile mockUser = UserProfile(
  name: 'Олена Коваленко',
  email: 'olena.kovalenko@example.com',
  phone: '+380 50 123 45 67',
  home: 'Моя квартира',
);

const List<SummaryItem> mockSummary = <SummaryItem>[
  SummaryItem(icon: Icons.wifi, label: 'Онлайн', value: '5 / 6'),
  SummaryItem(icon: Icons.bolt, label: 'Споживання', value: '3,2 кВт'),
  SummaryItem(icon: Icons.thermostat, label: 'Температура', value: '22,5 °C'),
];

const List<Device> mockDevices = <Device>[
  Device(
    id: 'DEV-001',
    name: 'Термостат',
    room: 'Вітальня',
    icon: Icons.thermostat,
    value: '22,5 °C',
    status: DeviceStatus.online,
    updated: '1 хв тому',
  ),
  Device(
    id: 'DEV-002',
    name: 'Освітлення',
    room: 'Кухня',
    icon: Icons.lightbulb_outline,
    value: '80 %',
    status: DeviceStatus.online,
    updated: '3 хв тому',
  ),
  Device(
    id: 'DEV-003',
    name: 'Розумна розетка',
    room: 'Спальня',
    icon: Icons.power_outlined,
    value: '120 Вт',
    status: DeviceStatus.online,
    updated: '5 хв тому',
  ),
  Device(
    id: 'DEV-004',
    name: 'Датчик вологості',
    room: 'Ванна',
    icon: Icons.water_drop_outlined,
    value: '48 %',
    status: DeviceStatus.online,
    updated: '2 хв тому',
  ),
  Device(
    id: 'DEV-005',
    name: 'Дверний замок',
    room: 'Передпокій',
    icon: Icons.lock_outline,
    value: 'Зачинено',
    status: DeviceStatus.online,
    updated: '10 хв тому',
  ),
  Device(
    id: 'DEV-006',
    name: 'Камера',
    room: 'Двір',
    icon: Icons.videocam_outlined,
    value: 'Немає зв’язку',
    status: DeviceStatus.offline,
    updated: '2 год тому',
  ),
];
