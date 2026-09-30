import 'package:flutter/material.dart';
import '../../models/station.dart';
import '../theme/stations_styles.dart';

class StationCard extends StatelessWidget {
  final Station station;
  final VoidCallback onEdit;
  final VoidCallback onView;
  final VoidCallback onDelete;

  const StationCard({
    super.key,
    required this.station,
    required this.onEdit,
    required this.onView,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: StationsStyles.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nombre y Badge Activo / Inactivo
            Row(
              children: [
                Expanded(
                  child: Text(
                    station.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: StationsStyles.titleColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: station.isActive
                        ? StationsStyles.activeBg
                        : StationsStyles.inactiveBg,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    station.isActive ? 'Activo' : 'Inactivo',
                    style: TextStyle(
                      color: station.isActive
                          ? StationsStyles.activeText
                          : StationsStyles.inactiveText,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 16, color: Color(0xFFF1F5F9)),

            // Datos Técnicos (Latitud, Longitud, Altitud)
            Row(
              children: [
                Expanded(
                  child: _buildDataColumn('LATITUD', station.latitude),
                ),
                Expanded(
                  child: _buildDataColumn('LONGITUD', station.longitude),
                ),
                Expanded(
                  child: _buildDataColumn('ALTITUD', '${station.altitude} msnm'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Botones de acción directos (Editar, Ver, Eliminar)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildActionButton(
                  icon: Icons.edit,
                  color: StationsStyles.editBlue,
                  onTap: onEdit,
                ),
                const SizedBox(width: 6),
                _buildActionButton(
                  icon: Icons.visibility,
                  color: StationsStyles.viewCyan,
                  onTap: onView,
                ),
                const SizedBox(width: 6),
                _buildActionButton(
                  icon: Icons.delete,
                  color: StationsStyles.deleteRed,
                  onTap: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }
}