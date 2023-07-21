import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.orange,
  Colors.teal,
  Colors.grey,
  Colors.green,
  Colors.yellow,
  Colors.red,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be betwwen 0 an ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: _colorThemes[selectedColor],
    brightness: Brightness.dark);
  }
}
