import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TypeOption { string, number, currency }

class CustomTextField extends StatelessWidget {
  final TypeOption type;
  final Function(String value) onChanged;

  const CustomTextField(
      {super.key, required this.onChanged, this.type = TypeOption.string});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: type == TypeOption.number
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
            ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: type == TypeOption.number ? 'Enter number' : 'Enter text',
      ),
      onChanged: onChanged,
    );
  }
}
