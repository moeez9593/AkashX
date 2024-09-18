import 'package:flutter/services.dart';

final class NoConsecutiveSpacesFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Check if there are consecutive spaces or leading spaces
    String newText = newValue.text;

    if (newText.contains('  ') || newText.startsWith(' ')) {
      return oldValue; // Ignore the input if it contains consecutive spaces or starts with space
    }

    return newValue; // Otherwise, accept the new value
  }
}

final class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('-', ''); // Remove any existing hyphens
    if (newText.length > 3 && newText.length <= 6) {
      newText = '${newText.substring(0, 3)}-${newText.substring(3)}';
    } else if (newText.length > 6 && newText.length <= 10) {
      newText = '${newText.substring(0, 3)}-${newText.substring(3, 6)}-${newText.substring(6)}';
    } else if (newText.length > 10) {
      newText = '${newText.substring(0, 3)}-${newText.substring(3, 6)}-${newText.substring(6, 10)}';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class EmojiFilteringTextInputFormatter extends TextInputFormatter {
  final RegExp _emojiRegex = RegExp(
    r'[\u{1F600}-\u{1F64F}' // Emoticons
    r'\u{1F300}-\u{1F5FF}' // Misc Symbols and Pictographs
    r'\u{1F680}-\u{1F6FF}' // Transport and Map Symbols
    r'\u{1F700}-\u{1F77F}' // Alchemical Symbols
    r'\u{1F780}-\u{1F7FF}' // Geometric Shapes Extended
    r'\u{1F800}-\u{1F8FF}' // Supplemental Arrows-C
    r'\u{1F900}-\u{1F9FF}' // Supplemental Symbols and Pictographs
    r'\u{1FA00}-\u{1FA6F}' // Chess Symbols
    r'\u{1FA70}-\u{1FAFF}' // Symbols and Pictographs Extended-A
    r'\u{2600}-\u{26FF}' // Misc Symbols
    r'\u{2700}-\u{27BF}' // Dingbats
    r'\u{FE00}-\u{FE0F}' // Variation Selectors
    r'\u{1F1E6}-\u{1F1FF}]', // Flags
    unicode: true,
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String filteredText = newValue.text.replaceAll(_emojiRegex, '');
    return newValue.copyWith(
      text: filteredText,
      selection: updateCursorPosition(filteredText, newValue.selection),
    );
  }

  TextSelection updateCursorPosition(
    String filteredText,
    TextSelection currentSelection,
  ) {
    int baseOffset = currentSelection.baseOffset;
    int extentOffset = currentSelection.extentOffset;

    if (currentSelection.baseOffset > filteredText.length) {
      baseOffset = filteredText.length;
    }

    if (currentSelection.extentOffset > filteredText.length) {
      extentOffset = filteredText.length;
    }

    return TextSelection(
      baseOffset: baseOffset,
      extentOffset: extentOffset,
    );
  }
}
