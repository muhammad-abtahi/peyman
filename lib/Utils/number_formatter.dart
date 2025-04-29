import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimplePhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Get only the digits
    String digits = newValue.text.replaceAll(RegExp(r'[^\d+]'), '');
    
    // Limit to maximum 10 digits (excluding the country code)
    if (digits.startsWith('+')) {
      if (digits.length > 14) { // +971 + 10 digits
        digits = digits.substring(0, 14);
      }
    } else {
      if (digits.length > 10) {
        digits = digits.substring(0, 10);
      }
    }
    
    // Format with spaces
    String formatted = '';
    
    // Handle the country code if it exists
    if (digits.startsWith('+')) {
      // Extract and add country code
      int codeEnd = digits.length > 4 ? 4 : digits.length;
      formatted = digits.substring(0, codeEnd);
      
      // Remove country code from remaining digits
      digits = digits.substring(codeEnd < digits.length ? codeEnd : digits.length);
    }
    
    // Format remaining digits with spaces
    for (int i = 0; i < digits.length; i++) {
      // Add space after each group
      if (i == 0 && formatted.isNotEmpty) {
        formatted += ' '; // Space after country code
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

