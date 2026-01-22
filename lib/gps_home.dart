import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const GPSApp());
}

class GPSApp extends StatelessWidget {
  const GPSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GPS Distance Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // พิกัดปลายทาง
  static const double targetLat = 18.288878663310072;
  static const double targetLng = 99.49089381910751;

  double? currentLat;
  double? currentLng;
  double distance = 0;

  final MapController _mapController = MapController();

  Future<void> _requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
  }

  Future<void> _getCurrentPosition() async {
    await _requestPermission();

    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      currentLat = pos.latitude;
      currentLng = pos.longitude;
      distance =
          Geolocator.distanceBetween(
            currentLat!,
            currentLng!,
            targetLat,
            targetLng,
          ) /
          1000;
    });

    _mapController.move(LatLng(currentLat!, currentLng!), 15);
  }

  @override
  Widget build(BuildContext context) {
    LatLng targetPoint = LatLng(targetLat, targetLng);

    return Scaffold(
      appBar: AppBar(
        title: const Text("GPS Distance Calculator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: targetPoint, // ✅ แก้จาก center
                initialZoom: 14, // ✅ แก้จาก zoom
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),

                /// MARKERS
                MarkerLayer(
                  markers: [
                    if (currentLat != null && currentLng != null)
                      Marker(
                        width: 40,
                        height: 40,
                        point: LatLng(currentLat!, currentLng!),
                        child: const Icon(
                          // ✅ แก้จาก builder
                          Icons.my_location,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    Marker(
                      width: 40,
                      height: 40,
                      point: targetPoint,
                      child: const Icon(
                        // ✅ แก้จาก builder
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),

                /// เส้นทาง
                if (currentLat != null && currentLng != null)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [LatLng(currentLat!, currentLng!), targetPoint],
                        strokeWidth: 4,
                        color: Colors.blue,
                      ),
                    ],
                  ),
              ],
            ),
          ),

          /// แสดงข้อมูล
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Text(
                  currentLat == null
                      ? "กดปุ่มเพื่อดึงตำแหน่งปัจจุบัน"
                      : "ตำแหน่งปัจจุบัน:\nLat: $currentLat\nLng: $currentLng",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "ระยะทาง: ${distance.toStringAsFixed(3)} กม.",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _getCurrentPosition,
                  icon: const Icon(Icons.location_searching),
                  label: const Text("Get Current Position"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
