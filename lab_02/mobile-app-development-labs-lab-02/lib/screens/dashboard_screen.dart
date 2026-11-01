import 'package:flutter/material.dart';
import 'package:lab_02/data/device.dart';
import 'package:lab_02/data/mock_data.dart';
import 'package:lab_02/routes/app_routes.dart';
import 'package:lab_02/widgets/content_wrapper.dart';
import 'package:lab_02/widgets/device_grid.dart';
import 'package:lab_02/widgets/section_title.dart';
import 'package:lab_02/widgets/summary_row.dart';

/// Головний екран: огляд оселі та сітка IoT-пристроїв.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мої пристрої'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Профіль',
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () => navigator.pushNamed<void>(AppRoutes.profile),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ContentWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SectionTitle('Огляд оселі'),
              const SummaryRow(items: mockSummary),
              const SectionTitle('Пристрої'),
              DeviceGrid(
                devices: mockDevices,
                onTap: (Device device) => navigator.pushNamed<void>(
                  AppRoutes.deviceDetails,
                  arguments: device,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
