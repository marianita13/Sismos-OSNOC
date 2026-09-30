import 'package:flutter/material.dart';
import 'package:flutter_sismo/config/routes.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Extrae el nombre o correo para pasarlo al Home si se requiere
      final emailValue = emailController.text.trim();
      final userName = emailValue.isNotEmpty ? emailValue.split('@').first : 'Usuario';

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,
        arguments: userName,
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}