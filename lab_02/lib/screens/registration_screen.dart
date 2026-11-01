import 'package:flutter/material.dart';
import 'package:lab_02/routes/app_routes.dart';
import 'package:lab_02/widgets/app_text_field.dart';
import 'package:lab_02/widgets/auth_layout.dart';
import 'package:lab_02/widgets/auth_switch_link.dart';
import 'package:lab_02/widgets/password_field.dart';
import 'package:lab_02/widgets/primary_button.dart';

/// Екран реєстрації нового користувача.
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);

    return AuthLayout(
      title: 'Реєстрація',
      subtitle: 'Створіть обліковий запис для керування домом',
      showBackButton: true,
      children: <Widget>[
        const AppTextField(
          label: 'Ім’я та прізвище',
          icon: Icons.person_outline,
        ),
        const AppTextField(
          label: 'Електронна пошта',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const AppTextField(
          label: 'Телефон',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
        const PasswordField(label: 'Пароль'),
        const PasswordField(label: 'Повторіть пароль'),
        PrimaryButton(
          label: 'Створити обліковий запис',
          onPressed: () => navigator.pushNamedAndRemoveUntil<void>(
            AppRoutes.dashboard,
            (Route<dynamic> route) => false,
          ),
        ),
        AuthSwitchLink(
          question: 'Вже є обліковий запис?',
          action: 'Увійти',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
