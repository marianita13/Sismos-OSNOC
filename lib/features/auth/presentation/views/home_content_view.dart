import 'package:flutter/material.dart';
import '../theme/home_styles.dart';
import '../widgets/home_footer.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título Principal
          const Text(
            "Observatorio Sismológico del Nororiental Colombiano",
            style: HomeStyles.mainTitle,
          ),
          const SizedBox(height: 16),

          // Banner UDES
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: HomeStyles.udesBannerDecoration,
            child: Image.asset(
              'assets/images/logo_udes.png',
              height: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  "OBSERVATORIO SISMOLÓGICO DEL NORORIENTE COLOMBIANO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Tarjeta de Reporte Sísmico
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "REPORTE DE EVENTO SÍSMICO",
                    style: HomeStyles.cardTitle,
                  ),
                  Divider(),
                  SizedBox(height: 8),
                  Text("• Magnitud: 4.1", style: HomeStyles.bulletText),
                  SizedBox(height: 4),
                  Text("• Profundidad: 141 km", style: HomeStyles.bulletText),
                  SizedBox(height: 4),
                  Text("• Tiempo de origen: 2024-03-06", style: HomeStyles.bulletText),
                  SizedBox(height: 4),
                  Text("• Hora Local: 04:12 pm", style: HomeStyles.bulletText),
                  SizedBox(height: 4),
                  Text("• Localización: 6.77°, -73.20°", style: HomeStyles.bulletText),
                  SizedBox(height: 8),
                  Text(
                    "Municipios Cercanos:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 4.0),
                    child: Text(
                      "o Los Santos (Santander) a 6 km\n"
                      "o Jordán (Santander) a 8 km\n"
                      "o Zapatoca (Santander) a 15 km",
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Footer Institucional con Logos de UDES, CDMB y Servicio Geológico
          const HomeFooter(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}