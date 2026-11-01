import 'package:flutter_test/flutter_test.dart';
import 'package:lab_01/counter_logic.dart';

void main() {
  group('parseInput', () {
    test('parses positive and negative integers', () {
      expect((parseInput('5') as AddValue).value, 5);
      expect((parseInput('-12') as AddValue).value, -12);
      expect((parseInput(' 7 ') as AddValue).value, 7);
    });

    test('recognizes the reset command', () {
      expect(parseInput('Avada Kedavra'), isA<ResetCounter>());
    });

    test('rejects invalid input', () {
      for (final String value in <String>[
        '',
        'abc',
        '3.14',
        '0x10',
        '1e3',
        'avada kedavra',
        '!@#',
        '99999999999999999999',
      ]) {
        expect(parseInput(value), isA<InvalidInput>(), reason: value);
      }
    });
  });
}
