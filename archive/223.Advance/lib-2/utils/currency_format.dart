import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final int fixed;

  CurrencyInputFormatter({this.fixed = 2});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return const TextEditingValue();
    }

    double value = double.tryParse(newValue.text) ?? 0;

    String newText = value.toStringAsFixed(fixed);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
