import '../../models/station.dart';

class StationsController {
  List<Station> getStations() {
    return [
      Station(
        name: 'Estación Campo Hermoso CHER',
        latitude: '7° 6\' 3.6"',
        longitude: '73° 8\'26.472"',
        altitude: 902.6,
        isActive: true,
      ),
      Station(
        name: 'Estación Carrizal',
        latitude: '7° 8\'3.59"',
        longitude: '73° 9\'36.68"',
        altitude: 707.0,
        isActive: true,
      ),
      Station(
        name: 'Estación CAV Floridablanca',
        latitude: '7° 4\'16.5"',
        longitude: '73° 4\'24.588"',
        altitude: 1144.3,
        isActive: true,
      ),
      Station(
        name: 'Estación Corporación CDMB',
        latitude: '7° 7\'7.97"',
        longitude: '73° 7\'9.29"',
        altitude: 973.0,
        isActive: true,
      ),
      Station(
        name: 'Estación Girón-Acapulco',
        latitude: '7° 3\'55.34"',
        longitude: '73° 7\'40.76"',
        altitude: 757.0,
        isActive: false,
      ),
      Station(
        name: 'Estación Mesa de Los Santos',
        latitude: '6° 53\'50.71"',
        longitude: '73° 2\'9.64"',
        altitude: 1687.0,
        isActive: true,
      ),
      Station(
        name: 'Estación Parque Morrorico MORR',
        latitude: '7° 7\'58.728"',
        longitude: '73° 6\'24.642"',
        altitude: 1177.0,
        isActive: true,
      ),
      Station(
        name: 'Estación UIS',
        latitude: '7° 8\'25.57"',
        longitude: '73° 7\'8.43"',
        altitude: 998.0,
        isActive: true,
      ),
      Station(
        name: 'Estación Villa Helena VHEL',
        latitude: '7° 9\'16.458"',
        longitude: '73° 7\'36.546"',
        altitude: 665.3,
        isActive: true,
      ),
      Station(
        name: 'Estación Vivero la Rosita LROS',
        latitude: '7° 6\'40.824"',
        longitude: '73° 7\'29.55"',
        altitude: 899.5,
        isActive: true,
      ),
      Station(
        name: 'Estación Vivero Nazareth VNAZ',
        latitude: '7° 8\'5.376"',
        longitude: '73° 7\'56.88"',
        altitude: 945.0,
        isActive: true,
      ),
      Station(
        name: 'Estación Vivero Provenza',
        latitude: '7° 4\'56.06"',
        longitude: '73° 6\'45.61"',
        altitude: 900.0,
        isActive: false,
      ),
    ];
  }
}