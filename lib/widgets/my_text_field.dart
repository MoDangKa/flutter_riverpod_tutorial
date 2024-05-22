import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/currency_format.dart';

enum MyTextFieldTypeOption { string, number, currency }

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final MyTextFieldTypeOption type;
  final String value;
  final int decimal;

  const MyTextField({
    super.key,
    required this.controller,
    this.value = "",
    this.type = MyTextFieldTypeOption.string,
    this.decimal = 2,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextField> {
  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case MyTextFieldTypeOption.number:
        return TextInputType.number;
      case MyTextFieldTypeOption.currency:
        return const TextInputType.numberWithOptions(decimal: true);
      case MyTextFieldTypeOption.string:
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> _getInputFormatters() {
    switch (widget.type) {
      case MyTextFieldTypeOption.number:
        return <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
      case MyTextFieldTypeOption.currency:
        return <TextInputFormatter>[
          CurrencyInputFormatter(fixed: widget.decimal)
        ];
      case MyTextFieldTypeOption.string:
      default:
        return <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
        ];
    }
  }

  String _getLabelText() {
    switch (widget.type) {
      case MyTextFieldTypeOption.number:
        return 'Enter number';
      case MyTextFieldTypeOption.currency:
        return 'Enter currency';
      case MyTextFieldTypeOption.string:
      default:
        return 'Enter text';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: _getKeyboardType(),
      inputFormatters: _getInputFormatters(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: _getLabelText(),
      ),
    );
  }
}
