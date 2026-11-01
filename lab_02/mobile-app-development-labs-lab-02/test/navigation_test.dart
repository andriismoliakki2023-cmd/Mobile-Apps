import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_02/main.dart';

Future<void> _tapText(WidgetTester tester, String text) async {
  final Finder finder = find.text(text);
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('login opens registration and back', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SmartHomeApp());
    expect(find.text('Увійти'), findsOneWidget);

    await _tapText(tester, 'Зареєструватися');
    expect(find.text('Реєстрація'), findsOneWidget);

    await _tapText(tester, 'Увійти');
    expect(find.text('Реєстрація'), findsNothing);
    expect(find.text('Розумний дім'), findsOneWidget);
  });

  testWidgets('login leads to dashboard, profile and logout', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SmartHomeApp());

    await _tapText(tester, 'Увійти');
    expect(find.text('Мої пристрої'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.account_circle_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Профіль'), findsOneWidget);

    await _tapText(tester, 'Вийти');
    expect(find.text('Увійти'), findsOneWidget);
  });

  testWidgets('registration leads to dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartHomeApp());

    await _tapText(tester, 'Зареєструватися');
    await _tapText(tester, 'Створити обліковий запис');
    expect(find.text('Мої пристрої'), findsOneWidget);
  });

  testWidgets('device card opens details screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartHomeApp());

    await _tapText(tester, 'Увійти');
    await _tapText(tester, 'Термостат');
    expect(find.text('Ідентифікатор'), findsOneWidget);
    expect(find.text('DEV-001'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Мої пристрої'), findsOneWidget);
  });
}
