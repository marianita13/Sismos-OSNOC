import 'package:flutter/material.dart';

class HomeStyles {
  // Colores principales
  static const Color osnocGreen = Color(0xFF1E824C);
  static const Color osnocHeaderBg = Color(0xFF2C3E50);
  static const Color cardHeaderBlue = Color(0xFF1E3A8A);
  static const Color scaffoldBg = Color(0xFFF4F6F7);

  // Tipografías
  static const TextStyle mainTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: cardHeaderBlue,
  );

  static const TextStyle bulletText = TextStyle(
    fontSize: 14,
    color: Colors.black87,
  );

  // Decoración de tarjeta de logo UDES
  static BoxDecoration udesBannerDecoration = BoxDecoration(
    color: cardHeaderBlue,
    borderRadius: BorderRadius.circular(8),
  );
}