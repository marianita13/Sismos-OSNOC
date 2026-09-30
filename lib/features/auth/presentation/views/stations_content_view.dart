import 'package:flutter/material.dart';
import '../../models/station.dart';
import '../controllers/stations_controller.dart';
import '../theme/stations_styles.dart';
import '../widgets/station_card.dart';
import '../widgets/user_profile_footer.dart';


class StationsContentView extends StatefulWidget {
  const StationsContentView({super.key});

  @override
  State<StationsContentView> createState() => _StationsContentViewState();
}

class _StationsContentViewState extends State<StationsContentView> {
  final StationsController _controller = StationsController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final List<Station> allStations = _controller.getStations();

    final List<Station> filteredStations = allStations.where((station) {
      final query = _searchQuery.toLowerCase();
      return station.name.toLowerCase().contains(query) ||
          station.latitude.toLowerCase().contains(query) ||
          station.longitude.toLowerCase().contains(query);
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          const Text('Estaciones Sismológicas', style: StationsStyles.sectionTitle),
          const SizedBox(height: 16),

          // Botones de Encabezado (Exportar / Nueva Estación)
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.file_download, size: 16, color: Colors.white),
                  label: const Text('EXPORTAR', style: StationsStyles.actionBtnText),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: StationsStyles.exportGreen,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 16, color: Colors.white),
                  label: const Text('NUEVA ESTACIÓN', style: StationsStyles.actionBtnText),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: StationsStyles.primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Buscador
          TextField(
            onChanged: (value) => setState(() => _searchQuery = value),
            enableInteractiveSelection: false,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hintText: 'Buscar estación...',
              hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              prefixIcon: const Icon(Icons.search, size: 18, color: Color(0xFF64748B)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: StationsStyles.borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: StationsStyles.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: StationsStyles.primaryBlue, width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Contador de Registros
          Text(
            'Mostrando ${filteredStations.length} de ${allStations.length} registros',
            style: const TextStyle(
              fontSize: 12,
              color: StationsStyles.subtextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),

          // Lista de Tarjetas
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredStations.length,
            itemBuilder: (context, index) {
              final station = filteredStations[index];
              return StationCard(
                station: station,
                onEdit: () {},
                onView: () {},
                onDelete: () {},
              );
            },
          ),
          const SizedBox(height: 24),

          // Footer Institucional
          const UserProfileFooter(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}