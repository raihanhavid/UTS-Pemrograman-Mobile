// lib/fragments/cuaca_fragment.dart

import 'package:flutter/material.dart';

class CuacaFragment extends StatelessWidget {
  const CuacaFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Bandung, Indonesia', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Bagian Suhu Utama
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.indigo.shade100,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('28°C', style: TextStyle(fontSize: 70, fontWeight: FontWeight.w300, color: Colors.indigo)), // Suhu statis 
                        const Text('Cerah Berawan', style: TextStyle(fontSize: 20, color: Colors.indigo)),
                      ],
                    ),
                    // Gambar animasi kondisi cuaca 
                    Image.asset(
                      'assets/sunny_cloud.png', // Ganti dengan path aset Anda
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Detail Cuaca (Kelembapan, Angin, dll) 
            const Text('Detail Kondisi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildDetailBox(Icons.water_drop, 'Kelembapan', '75%', Colors.blue), // Kelembapan statis 
                _buildDetailBox(Icons.air, 'Angin', '10 km/h', Colors.green),
                _buildDetailBox(Icons.wb_sunny, 'UV Index', '6 (High)', Colors.orange),
              ],
            ),
            const SizedBox(height: 30),

            // Prakiraan Harian Statis
            const Text('Prakiraan 5 Hari', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _buildDailyForecast('Senin', '29° / 18°', Icons.sunny),
            _buildDailyForecast('Selasa', '27° / 17°', Icons.cloud),
            _buildDailyForecast('Rabu', '25° / 16°', Icons.thunderstorm),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailBox(IconData icon, String label, String value, Color color) {
    return Column(
      children: <Widget>[
        Icon(icon, size: 40, color: color),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _buildDailyForecast(String day, String temp, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(day),
      trailing: Text(temp, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}