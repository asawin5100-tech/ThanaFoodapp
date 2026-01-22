import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final lat = args?['lat'];
    final lng = args?['lng'];
    final distance = args?['distance'];

    return Scaffold(
      appBar: AppBar(title: const Text("GPS Detail")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Latitude: ${lat ?? '-'}"),
            Text("Longitude: ${lng ?? '-'}"),
            const SizedBox(height: 10),
            Text(
              "ระยะทาง: ${distance != null ? distance.toStringAsFixed(2) : '-'} กม.",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("กลับหน้าแผนที่"),
            ),
          ],
        ),
      ),
    );
  }
}
