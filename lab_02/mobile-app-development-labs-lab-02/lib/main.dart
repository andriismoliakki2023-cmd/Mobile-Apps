import 'package:flutter/material.dart';
import 'package:lab_02/routes/app_router.dart';
import 'package:lab_02/routes/app_routes.dart';
import 'package:lab_02/theme/app_theme.dart';

void main() {
  runApp(const SmartHomeApp());
}

/// Кореневий віджет застосунку «Розумний дім».
class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Розумний дім',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: AppRoutes.login,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
