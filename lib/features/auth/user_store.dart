class UserStore {
  // Almacena: {"correo": "Nombre y Apellido"}
  static final Map<String, String> _users = {};

  /// Registra un nuevo usuario
  static void registerUser({required String email, required String name}) {
    _users[email.trim()] = name.trim();
  }

  /// Verifica si el correo ya está registrado
  static bool isUserRegistered(String email) {
    return _users.containsKey(email.trim());
  }

  /// Obtiene el nombre completo del usuario según su correo
  static String? getNameByEmail(String email) {
    return _users[email.trim()];
  }
}