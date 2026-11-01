import 'package:flutter/material.dart';
import 'package:lab_01/counter_logic.dart';

/// Сторінка з лічильником і полем введення.
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final TextEditingController _controller = TextEditingController();
  int _counter = 0;
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final CounterCommand command = parseInput(_controller.text);

    switch (command) {
      case AddValue(:final int value):
        setState(() {
          _counter += value;
          _errorText = null;
        });
        _controller.clear();
      case ResetCounter():
        setState(() {
          _counter = 0;
          _errorText = null;
        });
        _controller.clear();
      case InvalidInput():
        const String message =
            'Невалідне введення. Введіть ціле число або "$resetCommand".';
        setState(() => _errorText = message);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: const Text(message),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('Лічильник'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Поточне значення:',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '$_counter',
                key: const Key('counterValue'),
                style: theme.textTheme.displayLarge,
              ),
              const SizedBox(height: 32),
              TextField(
                key: const Key('inputField'),
                controller: _controller,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Число або команда',
                  hintText: 'Наприклад: 5, -3 або $resetCommand',
                  errorText: _errorText,
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                key: const Key('submitButton'),
                onPressed: _submit,
                icon: const Icon(Icons.check),
                label: const Text('Застосувати'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
