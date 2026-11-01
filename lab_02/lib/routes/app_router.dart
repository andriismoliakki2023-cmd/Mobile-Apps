import 'package:flutter/material.dart';
import 'package:lab_02/data/device.dart';
import 'package:lab_02/routes/app_routes.dart';
import 'package:lab_02/screens/dashboard_screen.dart';
import 'package:lab_02/screens/device_details_screen.dart';
import 'package:lab_02/screens/login_screen.dart';
import 'package:lab_02/screens/registration_screen.dart';
import 'package:lab_02/screens/user_profile_screen.dart';

/// Створює маршрут за його іменем (іменована навігація Navigator 1.0).
Route<void> onGenerateRoute(RouteSettings settings) {
  final Widget page = switch (settings.name) {
    AppRoutes.registration => const RegistrationScreen(),
    AppRoutes.dashboard => const DashboardScreen(),
    AppRoutes.profile => const UserProfileScreen(),
    AppRoutes.deviceDetails => DeviceDetailsScreen(
      device: settings.arguments! as Device,
    ),
    _ => const LoginScreen(),
  };

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => page,
  );
}
