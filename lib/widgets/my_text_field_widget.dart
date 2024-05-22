import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../utils/currency_format.dart';

enum Type2Option { string, number, currency }

class MyTextFieldWidget extends StatefulWidget {
  final Type2Option type;
  final String value;
  final int decimal;
  final Function(String value) onChanged;

  const MyTextFieldWidget({
    super.key,
    required this.onChanged,
    this.value = "",
    this.type = Type2Option.string,
    this.decimal = 2,
  });

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  final TextEditingController _textController = TextEditingController();
  final Logger logger = Logger(printer: PrettyPrinter());

  @override
  void initState() {
    super.initState();
    _textController.text = widget.value;
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    String newText;
    switch (widget.type) {
      case Type2Option.currency:
        newText = double.tryParse(_textController.text)?.toString() ?? '';
        break;
      default:
        newText = _textController.text;
        break;
    }
    logger.d('Text Changed: $newText');
    widget.onChanged(newText);
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case Type2Option.number:
        return TextInputType.number;
      case Type2Option.currency:
        return const TextInputType.numberWithOptions(decimal: true);
      case Type2Option.string:
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> _getInputFormatters() {
    switch (widget.type) {
      case Type2Option.number:
        return <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
      case Type2Option.currency:
        return <TextInputFormatter>[
          CurrencyInputFormatter(fixed: widget.decimal)
        ];
      case Type2Option.string:
      default:
        return <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
        ];
    }
  }

  String _getLabelText() {
    switch (widget.type) {
      case Type2Option.number:
        return 'Enter number';
      case Type2Option.currency:
        return 'Enter currency';
      case Type2Option.string:
      default:
        return 'Enter text';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      keyboardType: _getKeyboardType(),
      inputFormatters: _getInputFormatters(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: _getLabelText(),
      ),
    );
  }
}
