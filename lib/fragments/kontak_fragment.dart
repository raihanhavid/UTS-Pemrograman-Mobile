// lib/fragments/kontak_fragment.dart

import 'package:flutter/material.dart';
import '../models/kontak.dart';

class KontakFragment extends StatelessWidget {
  const KontakFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: staticKontakList.length, // Setidaknya 15 kontak [cite: 21]
      itemBuilder: (context, index) {
        final kontak = staticKontakList[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              // Gambar/icon statis [cite: 20]
              child: Text(kontak.nama[0], style: const TextStyle(fontWeight: FontWeight.bold)), 
            ),
            title: Text(kontak.nama, style: const TextStyle(fontWeight: FontWeight.bold)), // Name [cite: 20]
            subtitle: Text(kontak.telepon), // Phone [cite: 20]
            trailing: const Icon(Icons.call, color: Colors.green),
            onTap: () {
              // Aksi ketika kontak diklik (opsional)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Memanggil ${kontak.telepon}')),
              );
            },
          ),
        );
      },
    );
  }
}