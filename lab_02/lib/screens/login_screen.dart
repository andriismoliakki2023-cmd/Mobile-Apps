import 'package:flutter/material.dart';
import 'package:lab_02/routes/app_routes.dart';
import 'package:lab_02/widgets/app_text_field.dart';
import 'package:lab_02/widgets/auth_layout.dart';
import 'package:lab_02/widgets/auth_switch_link.dart';
import 'package:lab_02/widgets/password_field.dart';
import 'package:lab_02/widgets/primary_button.dart';

/// Екран авторизації.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);

    return AuthLayout(
      title: 'Розумний дім',
      subtitle: 'Увійдіть, щоб керувати пристроями',
      children: <Widget>[
        const AppTextField(
          label: 'Електронна пошта',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const PasswordField(label: 'Пароль'),
        PrimaryButton(
          label: 'Увійти',
          onPressed: () => navigator.pushReplacementNamed<void, void>(
            AppRoutes.dashboard,
          ),
        ),
        AuthSwitchLink(
          question: 'Немає облікового запису?',
          action: 'Зареєструватися',
          onPressed: () => navigator.pushNamed<void>(AppRoutes.registration),
        ),
      ],
    );
  }
}
