import 'package:flutter/material.dart';
import '../controllers/user_profile_controller.dart';
import '../theme/user_profile_styles.dart';
import '../views/user_profile_content_view.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late final UserProfileController _controller;

  @override
  void initState() {
    super.initState();
    _controller = UserProfileController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.initUserFromArgs(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: UserProfileStyles.scaffoldBg,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            iconTheme: const IconThemeData(color: UserProfileStyles.darkText),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: UserProfileStyles.darkText),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo_osnoc.png',
                  height: 24,
                  width: 24,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.hub_outlined, color: UserProfileStyles.brandGreen, size: 24),
                ),
                const SizedBox(width: 8),
                const Text(
                  "OSNOC",
                  style: TextStyle(
                    color: UserProfileStyles.brandGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: UserProfileStyles.osnocBlue,
                      child: Icon(Icons.person, size: 14, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _controller.fullName,
                      style: const TextStyle(
                        color: UserProfileStyles.darkText,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Drawer Lateral con Nombre Dinámico
          drawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Color(0xFF2D3748)),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Color(0xFF2D3748)),
                  ),
                  accountName: Text(
                    _controller.fullName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  accountEmail: const Text('Observatorio Sismológico'),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.view_quilt_outlined, color: Color(0xFF475569)),
                        title: const Text('Contenidos sitio'),
                        onTap: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.search, color: Color(0xFF475569)),
                        title: const Text('Log eventos'),
                        onTap: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.newspaper_outlined, color: Color(0xFF475569)),
                        title: const Text('Noticias'),
                        onTap: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.share_outlined, color: Color(0xFF475569)),
                        title: const Text('Redes Sociales'),
                        onTap: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.bar_chart_outlined, color: Color(0xFF475569)),
                        title: const Text('Reportes Sísmicos'),
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text(
                    'Cerrar sesión',
                    style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => _controller.logout(context),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),

          // Cuerpo con Contenido de Perfil
          body: SafeArea(
            child: UserProfileContentView(controller: _controller),
          ),

          // Bottom Navigation Bar
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: const Color(0xFFC8E6C9),
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: UserProfileStyles.darkText,
                  );
                }
                return const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: UserProfileStyles.mutedText,
                );
              }),
            ),
            child: NavigationBar(
              selectedIndex: _controller.currentIndex,
              backgroundColor: const Color(0xFFF1F5F9),
              elevation: 4,
              onDestinationSelected: (index) =>
                  _controller.onDestinationSelected(context, index),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined, color: Color(0xFF334155)),
                  selectedIcon: Icon(Icons.home, color: UserProfileStyles.brandGreen),
                  label: 'Inicio',
                ),
                NavigationDestination(
                  icon: Icon(Icons.cell_tower_outlined, color: Color(0xFF334155)),
                  selectedIcon: Icon(Icons.cell_tower, color: UserProfileStyles.brandGreen),
                  label: 'Estaciones',
                ),
                NavigationDestination(
                  icon: Icon(Icons.folder_outlined, color: Color(0xFF334155)),
                  selectedIcon: Icon(Icons.folder, color: UserProfileStyles.brandGreen),
                  label: 'Proyectos',
                ),
                NavigationDestination(
                  icon: Icon(Icons.article_outlined, color: Color(0xFF334155)),
                  selectedIcon: Icon(Icons.article, color: UserProfileStyles.brandGreen),
                  label: 'Publicaciones',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline, color: Color(0xFF334155)),
                  selectedIcon: Icon(Icons.person, color: UserProfileStyles.brandGreen),
                  label: 'Perfil',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}