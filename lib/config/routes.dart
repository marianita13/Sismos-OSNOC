import 'package:flutter/material.dart';
import 'package:flutter_sismo/features/auth/presentation/pages/home_page.dart';
import 'package:flutter_sismo/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_sismo/features/auth/presentation/pages/stations_page.dart';
import 'package:flutter_sismo/features/auth/presentation/pages/user_profile_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String stations = '/stations';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginPage(),
      home: (context) => const HomePage(),
      stations: (context) => const StationsPage(),
      profile: (context) => const UserProfilePage(),
    };
  }
}