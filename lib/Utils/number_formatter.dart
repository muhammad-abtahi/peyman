import 'package:flutter/services.dart';

class SimplePhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'[^\d+]'), '');
    
    if (digits.startsWith('+')) {
      if (digits.length > 14) { 
        digits = digits.substring(0, 14);
      }
    } else {
      if (digits.length > 10) {
        digits = digits.substring(0, 10);
      }
    }
    
    String formatted = '';
    
    if (digits.startsWith('+')) {
      int codeEnd = digits.length > 4 ? 4 : digits.length;
      formatted = digits.substring(0, codeEnd);
      
      digits = digits.substring(codeEnd < digits.length ? codeEnd : digits.length);
    }
    
    for (int i = 0; i < digits.length; i++) {
      if (i == 0 && formatted.isNotEmpty) {
        formatted += ' '; 
      } else if (i == 3 || i == 6) {
        formatted += ' ';
      }
      formatted += digits[i];
    }
    
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

