import 'package:flutter/material.dart';
import 'package:lab_02/data/mock_data.dart';
import 'package:lab_02/routes/app_routes.dart';
import 'package:lab_02/theme/app_spacing.dart';
import 'package:lab_02/widgets/content_wrapper.dart';
import 'package:lab_02/widgets/info_card.dart';
import 'package:lab_02/widgets/info_tile.dart';
import 'package:lab_02/widgets/primary_button.dart';
import 'package:lab_02/widgets/profile_header.dart';
import 'package:lab_02/widgets/section_title.dart';

/// Екран профілю користувача.
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Профіль')),
      body: SingleChildScrollView(
        child: ContentWrapper(
          maxWidth: AppSpacing.maxFormWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ProfileHeader(name: mockUser.name, email: mockUser.email),
              const SectionTitle('Контакти'),
              InfoCard(
                tiles: <InfoTile>[
                  InfoTile(
                    icon: Icons.phone_outlined,
                    label: 'Телефон',
                    value: mockUser.phone,
                  ),
                  InfoTile(
                    icon: Icons.home_outlined,
                    label: 'Оселя',
                    value: mockUser.home,
                  ),
                ],
              ),
              const SectionTitle('Налаштування'),
              const InfoCard(
                tiles: <InfoTile>[
                  InfoTile(
                    icon: Icons.notifications_none,
                    label: 'Сповіщення',
                    value: 'Увімкнено',
                  ),
                  InfoTile(
                    icon: Icons.language,
                    label: 'Мова',
                    value: 'Українська',
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.l),
              PrimaryButton(
                label: 'Вийти',
                onPressed: () => navigator.pushNamedAndRemoveUntil<void>(
                  AppRoutes.login,
                  (Route<dynamic> route) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
