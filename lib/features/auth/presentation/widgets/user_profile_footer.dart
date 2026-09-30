import 'package:flutter/material.dart';
import '../theme/user_profile_styles.dart';

class UserProfileFooter extends StatelessWidget {
  const UserProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_udes.png',
                  height: 38,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'assets/images/logo_cdmb.png',
                  height: 38,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'assets/images/logo_servicio.png',
                  height: 38,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 12,
                color: UserProfileStyles.mutedText,
              ),
              children: [
                TextSpan(text: "© 2026 Desarrollado por "),
                TextSpan(
                  text: "Vicerrectoría de Extensión de la UDES",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: UserProfileStyles.osnocBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}