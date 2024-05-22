import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/currency_format.dart';

enum Type3Option { string, number, currency }

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final Type3Option type;
  final String value;
  final int decimal;

  const MyTextField({
    super.key,
    required this.controller,
    this.value = "",
    this.type = Type3Option.string,
    this.decimal = 2,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextField> {
  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case Type3Option.number:
        return TextInputType.number;
      case Type3Option.currency:
        return const TextInputType.numberWithOptions(decimal: true);
      case Type3Option.string:
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> _getInputFormatters() {
    switch (widget.type) {
      case Type3Option.number:
        return <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
      case Type3Option.currency:
        return <TextInputFormatter>[
          CurrencyInputFormatter(fixed: widget.decimal)
        ];
      case Type3Option.string:
      default:
        return <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
        ];
    }
  }

  String _getLabelText() {
    switch (widget.type) {
      case Type3Option.number:
        return 'Enter number';
      case Type3Option.currency:
        return 'Enter currency';
      case Type3Option.string:
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
