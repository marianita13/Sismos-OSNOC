import 'package:flutter/material.dart';

class StationDetailPage extends StatelessWidget {
  final Map<String, dynamic>? stationData;

  const StationDetailPage({super.key, this.stationData});

  @override
  Widget build(BuildContext context) {
    final name = stationData?['name'] ?? 'Estación Campo Hermoso CHER';
    final lat = stationData?['latitude'] ?? "7° 6' 3.6\"";
    final lng = stationData?['longitude'] ?? "73° 8'26.472\"";
    final alt = stationData?['altitude'] ?? '902.6 msnm';
    final bool isActive = stationData?['active'] ?? true;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Información Estación Sismológica'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen de la estación y Nombre
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isDesktop = constraints.maxWidth > 600;
                    return Flex(
                      direction: isDesktop ? Axis.horizontal : Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: isDesktop ? 220 : double.infinity,
                            height: 180,
                            color: Colors.grey[200],
                            child: Image.asset(
                              'assets/images/estacion_campo_hermoso.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: isDesktop ? 20 : 0,
                          height: isDesktop ? 0 : 16,
                        ),
                        Expanded(
                          flex: isDesktop ? 1 : 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nombre',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F5F9),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    color: Color(0xFF334155),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE056FD),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text('VER UBICACIÓN'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Campos Latitud, Longitud y Altura
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return Row(
                        children: [
                          Expanded(
                            child: _buildDetailField(
                              'Latitud (grados, minutos, segundos)',
                              lat,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildDetailField(
                              'Longitud (grados, minutos, segundos)',
                              lng,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildDetailField(
                              'Altura (msnm)',
                              alt,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _buildDetailField(
                            'Latitud (grados, minutos, segundos)',
                            lat,
                          ),
                          const SizedBox(height: 12),
                          _buildDetailField(
                            'Longitud (grados, minutos, segundos)',
                            lng,
                          ),
                          const SizedBox(height: 12),
                          _buildDetailField('Altura (msnm)', alt),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Características Técnicas
                const Text(
                  'Características Técnicas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF475569),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  height: 120,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xFFCBD5E1)),
                  ),
                  child: const SingleChildScrollView(
                    child: Text(
                      'Estación Campo Hermoso\nUn acelerógrafo de movimiento fuerte. Es un dispositivo especializado para el registro en tiempo real de movimientos fuertes ocasionados por eventos sísmicos. Miden la aceleración del suelo en altas frecuencias de muestreo. Su sensibilidad se encuentra muy por debajo de las de los sismómetros y por tanto son capaces de registrar movimientos de mayor amplitud. Son útiles para localizar el hipocentro y la magnitud de terremotos. En la Estación de la CDMB, ubicada en el barrio Campo Hermoso, Bucaramanga. Se utiliza el acelerógrafo modelo TRITON FB160 que es un acelerógrafo de alta precisión.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF334155)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Checkbox Activa
                Row(
                  children: [
                    Checkbox(
                      value: isActive,
                      onChanged: null,
                    ),
                    const Text(
                      'Activa',
                      style: TextStyle(color: Color(0xFF475569)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color(0xFF475569),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 13, color: Color(0xFF334155)),
          ),
        ),
      ],
    );
  }
}