import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_02/main.dart';

const Map<String, Size> _screens = <String, Size>{
  'iPhone 8': Size(375, 667),
  'small phone': Size(320, 568),
  'tablet portrait': Size(768, 1024),
  'tablet landscape': Size(1024, 768),
};

Future<void> _tapText(WidgetTester tester, String text) async {
  final Finder finder = find.text(text);
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
  expect(tester.takeException(), isNull, reason: 'after tap "$text"');
}

void main() {
  for (final MapEntry<String, Size> screen in _screens.entries) {
    testWidgets('no overflow on ${screen.key}', (WidgetTester tester) async {
      tester.view.physicalSize = screen.value;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(const SmartHomeApp());
      expect(tester.takeException(), isNull);

      await _tapText(tester, 'Зареєструватися');
      await _tapText(tester, 'Створити обліковий запис');
      await _tapText(tester, 'Термостат');
      await tester.pageBack();
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.account_circle_outlined));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      await _tapText(tester, 'Вийти');
      expect(find.text('Увійти'), findsOneWidget);
    });
  }
}
