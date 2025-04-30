import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A formatter for Emirates ID in the format: 1-1234567-1
class EmiratesIdFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    if (digits.length > 9) {
      digits = digits.substring(0, 9);
    }
    
    String formatted = '';
    
    for (int i = 0; i < digits.length; i++) {
      if (i == 1 || i == 8) {
        formatted += '-';
      }
      formatted += digits[i];
    }
    
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

