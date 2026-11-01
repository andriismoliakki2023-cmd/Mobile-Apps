import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Рядок «питання + посилання» для переходу між входом і реєстрацією.
class AuthSwitchLink extends StatelessWidget {
  const AuthSwitchLink({
    required this.question,
    required this.action,
    required this.onPressed,
    super.key,
  });

  final String question;
  final String action;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.s),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(question),
          TextButton(onPressed: onPressed, child: Text(action)),
        ],
      ),
    );
  }
}
