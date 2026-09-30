import 'package:flutter/material.dart';
import '../views/stations_content_view.dart';
import '../widgets/home_footer.dart';

class StationsPage extends StatelessWidget {
  const StationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estaciones Sismológicas'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: StationsContentView(),
      bottomNavigationBar: const HomeFooter(),
    );
  }
}