import 'package:flutter/material.dart';
import 'package:flutter_sismo/config/routes.dart';
import 'package:flutter_sismo/features/auth/presentation/pages/home_page.dart';
import 'package:flutter_sismo/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_sismo/features/auth/presentation/pages/user_profile_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color udesBlue = Color(0xFF0077C8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sismo App - UDES',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: udesBlue,
          primary: udesBlue,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.getRoutes(),
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.profile) {
          return MaterialPageRoute(
            builder: (context) => const UserProfilePage(),
            settings: settings,
          );
        }
        if (settings.name == AppRoutes.home) {
          return MaterialPageRoute(
            builder: (context) => const HomePage(),
            settings: settings,
          );
        }
        if (settings.name == AppRoutes.login) {
          return MaterialPageRoute(
            builder: (context) => const LoginPage(),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}