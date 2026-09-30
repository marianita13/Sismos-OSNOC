import 'package:flutter/material.dart';

class LoginStyles {
  // Colores corporativos
  static const Color brandBlue = Color(0xFF0077C8);
  static const Color scaffoldBg = Color(0xFFFAFAFA);
  static const Color textDark = Color(0xFF1E293B);
  static const Color textHint = Color(0xFF94A3B8);
  static const Color borderSide = Color(0xFFE2E8F0);

  // Tipografías
  static const TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: brandBlue,
    letterSpacing: 0.2,
  );

  static const TextStyle inputTextStyle = TextStyle(
    fontSize: 14,
    color: textDark,
  );

  static const TextStyle hintStyle = TextStyle(
    color: textHint,
    fontSize: 14,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 13,
    letterSpacing: 0.8,
  );

  // Sombreado de los inputs
  static const List<BoxShadow> inputShadow = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];
}