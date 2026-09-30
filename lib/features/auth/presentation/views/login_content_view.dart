import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import '../theme/login_styles.dart';
import '../widgets/login_text_field.dart';

class LoginContentView extends StatelessWidget {
  final LoginController controller;

  const LoginContentView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo UDES
            SizedBox(
              height: 200,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  'assets/images/logo_udes.png',
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.school,
                      size: 180,
                      color: LoginStyles.brandBlue,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Título
            const Text(
              "Iniciar Sesión",
              style: LoginStyles.titleStyle,
            ),
            const SizedBox(height: 24),

            // Campo Correo
            LoginTextField(
              controller: controller.emailController,
              hint: "Correo electrónico",
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu correo electrónico';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Campo Contraseña
            LoginTextField(
              controller: controller.passwordController,
              hint: "Contraseña",
              icon: Icons.lock_outline,
              isPassword: true,
              obscureText: controller.obscurePassword,
              onTogglePassword: controller.togglePasswordVisibility, // <-- Corregido aquí
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu contraseña';
                }
                return null;
              },
            ),
            const SizedBox(height: 28),

            // Botón Iniciar Sesión
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => controller.login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: LoginStyles.brandBlue,
                  elevation: 2,
                  shadowColor: const Color(0x4D0077C8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "INICIAR SESIÓN",
                  style: LoginStyles.buttonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}