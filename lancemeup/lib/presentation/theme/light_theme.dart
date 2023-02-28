import 'package:flutter/material.dart';
import 'package:lancemeup/constants/value_constants.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Urbanist',
  colorScheme: const ColorScheme.light(
    primary: lancemeupColor,
    secondary: Color(0xFF757575),
    background: Colors.white,
    // Define other colors for light theme
  ),
);
