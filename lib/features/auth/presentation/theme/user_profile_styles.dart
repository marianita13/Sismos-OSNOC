import 'package:flutter/material.dart';

class UserProfileStyles {
  // Paleta de colores OSNOC
  static const Color osnocBlue = Color(0xFF1E3A8A);
  static const Color osnocLightBlue = Color(0xFF2563EB);
  static const Color osnocBgBlue = Color(0xFFEFF6FF);
  static const Color darkText = Color(0xFF1E293B);
  static const Color scaffoldBg = Color(0xFFF8FAFC);
  static const Color brandGreen = Color(0xFF2E7D32);
  static const Color borderSide = Color(0xFFE2E8F0);
  static const Color chipBorder = Color(0xFFBFDBFE);
  static const Color chipText = Color(0xFF1E40AF);
  static const Color mutedText = Color(0xFF64748B);

  // Tipografías
  static const TextStyle headerNameStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: osnocBlue,
  );

  static const TextStyle headerEmailStyle = TextStyle(
    fontSize: 12,
    color: Colors.black54,
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: Colors.black54,
  );

  static const TextStyle valueStyle = TextStyle(
    fontSize: 12,
    color: darkText,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle editButtonStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 13,
    letterSpacing: 0.5,
  );

  // Sombras
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
}