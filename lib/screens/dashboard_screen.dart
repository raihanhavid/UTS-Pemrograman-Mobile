// lib/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import '../fragments/berita_fragment.dart';
import '../fragments/biodata_fragment.dart';
import '../fragments/kalkulator_fragment.dart';
import '../fragments/kontak_fragment.dart';
import '../fragments/cuaca_fragment.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // List of Fragments/Widgets 
  final List<Widget> _fragments = <Widget>[
    const BiodataFragment(),
    const KontakFragment(),
    const KalkulatorFragment(),
    const CuacaFragment(),
    const BeritaFragment(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles = ['Biodata', 'Kontak', 'Kalkulator', 'Cuaca', 'Berita'];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
        backgroundColor: Colors.indigo,
      ),
      body: _fragments.elementAt(_selectedIndex), // Menampilkan Fragment yang aktif
      
      bottomNavigationBar: BottomNavigationBar( // Bottom Navigation Bar 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Biodata'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Kalkulator'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Cuaca'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Berita'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}