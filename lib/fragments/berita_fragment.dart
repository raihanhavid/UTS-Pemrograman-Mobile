// lib/fragments/berita_fragment.dart

import 'package:flutter/material.dart';
import '../models/berita.dart';

class BeritaFragment extends StatelessWidget {
  const BeritaFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: staticBeritaList.length,
      itemBuilder: (context, index) {
        final berita = staticBeritaList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Gambar Berita
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // Ganti dengan Image.asset(berita.imageUrl)
                    color: Colors.grey.shade300, 
                  ),
                  child: Center(child: Text('Image ${index + 1}')),
                ),
                // Teks Berita
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          berita.judul, // Pola tampilan yang berulang 
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(berita.sumber, style: TextStyle(color: Colors.indigo, fontSize: 12)),
                        const SizedBox(height: 5),
                        Text(berita.tanggal, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}