import 'package:flutter/material.dart';

class StationsStyles {
  // Colores primarios
  static const Color primaryBlue = Color(0xFF0056B3);
  static const Color exportGreen = Color(0xFF1E7E34);
  static const Color titleColor = Color(0xFF0F172A);
  static const Color subtextColor = Color(0xFF64748B);
  static const Color borderColor = Color(0xFFE2E8F0);

  // Colores de los botones de acción
  static const Color editBlue = Color(0xFF007BFF);
  static const Color viewCyan = Color(0xFF17A2B8);
  static const Color deleteRed = Color(0xFFDC3545);

  // Colores de estado
  static const Color activeBg = Color(0xFFDCFCE7);
  static const Color activeText = Color(0xFF15803D);
  static const Color inactiveBg = Color(0xFFFEE2E2);
  static const Color inactiveText = Color(0xFFB91C1C);

  // Estilos de texto
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: titleColor,
  );

  static const TextStyle actionBtnText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}