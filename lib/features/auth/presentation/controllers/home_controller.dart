import 'package:flutter/material.dart';
import '../../../../config/routes.dart';

class HomeController extends ChangeNotifier {
  int currentIndex = 0;
  String userName = 'Usuario';

  void initArguments(Object? args) {
    if (args is String && args.trim().isNotEmpty) {
      userName = args.trim();
    }
  }

  void changeTab(int index, BuildContext context) {
    if (index == 4) {
      // Si presiona Perfil en el BottomBar, abre la pantalla de perfil
      Navigator.pushNamed(
        context,
        AppRoutes.profile,
        arguments: userName,
      );
    } else {
      currentIndex = index;
      notifyListeners();
    }
  }

  void navigateToProfile(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.profile,
      arguments: userName,
    );
  }

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }
}