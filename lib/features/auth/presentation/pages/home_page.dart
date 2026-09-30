import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../theme/home_styles.dart';
import '../views/home_content_view.dart';
import '../views/stations_content_view.dart'; // Importante: importa la nueva vista

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    _controller.initArguments(args);
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
        final List<Widget> pages = [
          const HomeContentView(),
          StationsContentView(), // Reemplazado por la vista de estaciones
          const Center(child: Text("Pantalla: Proyectos")),
          const Center(child: Text("Pantalla: Publicaciones")),
          const SizedBox.shrink(),
        ];

        return Scaffold(
          backgroundColor: HomeStyles.scaffoldBg,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            iconTheme: const IconThemeData(color: Colors.black87),
            title: const Row(
              children: [
                Icon(Icons.hub_outlined, color: HomeStyles.osnocGreen),
                SizedBox(width: 8),
                Text(
                  "OSNOC",
                  style: TextStyle(
                    color: HomeStyles.osnocGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () => _controller.navigateToProfile(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Row(
                      children: [
                        const Icon(Icons.person, color: Colors.black54, size: 20),
                        const SizedBox(width: 6),
                        Text(
                          _controller.userName,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: HomeStyles.osnocHeaderBg),
                  accountName: Text(
                    _controller.userName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  accountEmail: const Text("Observatorio Sismológico"),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: HomeStyles.osnocHeaderBg),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.web_outlined),
                  title: const Text('Contenidos sitio'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.search),
                  title: const Text('Log eventos'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.newspaper),
                  title: const Text('Noticias'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Redes Sociales'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.bar_chart),
                  title: const Text('Reportes Sísmicos'),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text(
                    'Cerrar sesión',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onTap: () => _controller.logout(context),
                ),
              ],
            ),
          ),

          body: pages[_controller.currentIndex],

          bottomNavigationBar: NavigationBar(
            selectedIndex: _controller.currentIndex,
            onDestinationSelected: (index) => _controller.changeTab(index, context),
            indicatorColor: HomeStyles.osnocGreen.withValues(alpha: 0.2),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home, color: HomeStyles.osnocGreen),
                label: 'Inicio',
              ),
              NavigationDestination(
                icon: Icon(Icons.cell_tower_outlined),
                selectedIcon: Icon(Icons.cell_tower, color: HomeStyles.osnocGreen),
                label: 'Estaciones',
              ),
              NavigationDestination(
                icon: Icon(Icons.folder_open_outlined),
                selectedIcon: Icon(Icons.folder_open, color: HomeStyles.osnocGreen),
                label: 'Proyectos',
              ),
              NavigationDestination(
                icon: Icon(Icons.article_outlined),
                selectedIcon: Icon(Icons.article, color: HomeStyles.osnocGreen),
                label: 'Publicaciones',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person, color: HomeStyles.osnocGreen),
                label: 'Perfil',
              ),
            ],
          ),
        );
      },
    );
  }
}