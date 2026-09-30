import 'package:flutter/material.dart';

class UserProfileController extends ChangeNotifier {
  String _fullName = '111';
  int _currentIndex = 4;

  String get fullName => _fullName;
  int get currentIndex => _currentIndex;

  // Getters requeridos por user_profile_content_view.dart
  String get firstName {
    if (_fullName.trim().isEmpty) return '';
    final parts = _fullName.trim().split(' ');
    return parts.isNotEmpty ? parts.first : '';
  }

  String get lastName {
    if (_fullName.trim().isEmpty) return '';
    final parts = _fullName.trim().split(' ');
    return parts.length > 1 ? parts.sublist(1).join(' ') : '';
  }

  void initUserFromArgs(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String && args.isNotEmpty) {
      _fullName = args;
    } else if (args is Map<String, dynamic> && args.containsKey('name')) {
      _fullName = args['name'] as String;
    }
    notifyListeners();
  }

  void onDestinationSelected(BuildContext context, int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void logout(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }
}