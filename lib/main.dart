// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemrograman Mobile',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Data Anda (Ganti dengan data Anda)
  final String nim = "152022260";
  final String nama = "Muhammad Raihan Havid";
  final String judulAplikasi = "UTS APP";

  @override
  void initState() {
    super.initState();
    // Navigasi setelah 5 detik
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tampilan Splash Screen
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Ganti dengan Image.asset('assets/your_photo.jpg')
            const CircleAvatar(
              radius: 80,
              // GANTI BARIS INI:
              // backgroundColor: Colors.indigo,
              // child: Icon(Icons.person_outline, size: 80, color: Colors.white),

              // DENGAN BARIS INI UNTUK MENAMPILKAN FOTO DARI ASSETS:
              backgroundImage: AssetImage('assets/images/foto.jpg'),
            ),
            const SizedBox(height: 30),
            Text(
              judulAplikasi,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),
            Text('NIM: $nim', style: const TextStyle(fontSize: 18)),
            Text('Nama: $nama', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
