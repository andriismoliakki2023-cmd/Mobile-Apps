import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_01/main.dart';

Future<void> _enterAndSubmit(WidgetTester tester, String text) async {
  await tester.enterText(find.byKey(const Key('inputField')), text);
  await tester.tap(find.byKey(const Key('submitButton')));
  await tester.pump();
}

void main() {
  testWidgets('counter changes according to the rules', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CounterApp());
    expect(find.text('0'), findsOneWidget);

    await _enterAndSubmit(tester, '5');
    expect(find.text('5'), findsOneWidget);

    await _enterAndSubmit(tester, '-2');
    expect(find.text('3'), findsOneWidget);

    await _enterAndSubmit(tester, 'Avada Kedavra');
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('invalid input keeps counter and shows error', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CounterApp());
    await _enterAndSubmit(tester, '10');

    await _enterAndSubmit(tester, 'hello');
    expect(find.text('10'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);

    await _enterAndSubmit(tester, '1.5');
    expect(find.text('10'), findsOneWidget);
  });
}
