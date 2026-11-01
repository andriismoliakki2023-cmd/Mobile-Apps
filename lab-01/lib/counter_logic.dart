/// Команда, яка скидає лічильник до нуля.
const String resetCommand = 'Avada Kedavra';

final RegExp _integerPattern = RegExp(r'^[+-]?\d+$');

/// Результат обробки введеного користувачем рядка.
sealed class CounterCommand {
  const CounterCommand();
}

/// Додати [value] до лічильника (може бути від'ємним).
class AddValue extends CounterCommand {
  const AddValue(this.value);

  final int value;
}

/// Скинути лічильник до `0`.
class ResetCounter extends CounterCommand {
  const ResetCounter();
}

/// Невалідне введення - стан лічильника не змінюється.
class InvalidInput extends CounterCommand {
  const InvalidInput();
}

/// Розбирає [input] і повертає відповідну команду.
CounterCommand parseInput(String input) {
  if (input == resetCommand) {
    return const ResetCounter();
  }

  final String trimmed = input.trim();
  if (!_integerPattern.hasMatch(trimmed)) {
    return const InvalidInput();
  }

  final int? value = int.tryParse(trimmed);
  if (value == null) {
    return const InvalidInput();
  }
  return AddValue(value);
}
