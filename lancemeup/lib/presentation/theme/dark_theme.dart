import 'package:flutter/material.dart';
import 'package:lancemeup/constants/value_constants.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Urbanist',
  colorScheme: const ColorScheme.dark(
    primary: lancemeupColor,
    secondary: Color(0xFF9E9E9E),
    background: Colors.black,
    // Define other colors for dark theme
  ),
);
