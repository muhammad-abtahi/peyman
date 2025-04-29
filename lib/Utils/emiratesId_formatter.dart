import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A formatter for Emirates ID in the format: 1-1234567-1
class EmiratesIdFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Get only the digits
    String digits = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    // Limit to maximum 9 digits (Emirates ID format: X-XXXXXXX-X)
    if (digits.length > 9) {
      digits = digits.substring(0, 9);
    }
    
    // Format with hyphens
    String formatted = '';
    
    for (int i = 0; i < digits.length; i++) {
      // Add hyphen after the first digit and after the 8th digit
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

// Example usage:
// TextField(
//   keyboardType: TextInputType.number,
//   inputFormatters: [
//     EmiratesIdFormatter(),
//   ],
//   decoration: InputDecoration(
//     labelText: 'Emirates ID',
//     hintText: '1-1234567-1',
//   ),
// )