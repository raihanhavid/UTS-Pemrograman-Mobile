// lib/fragments/biodata_fragment.dart

import 'package:flutter/material.dart';

class BiodataFragment extends StatefulWidget {
  const BiodataFragment({super.key});

  @override
  State<BiodataFragment> createState() => _BiodataFragmentState();
}

class _BiodataFragmentState extends State<BiodataFragment> {
  String? _selectedProdi;
  String? _jenisKelamin;
  DateTime _tanggalLahir = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tanggalLahir,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _tanggalLahir) {
      setState(() {
        _tanggalLahir = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Foto Profile 
          Center(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.indigo, width: 3),
              ),
              child: const CircleAvatar(
                radius: 70,
                // Ganti dengan foto Anda
                backgroundImage: AssetImage('assets/profile_photo.jpg'), 
                child: Text('Foto', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Isian Teks 
          const Text('Nama Lengkap', style: TextStyle(fontWeight: FontWeight.bold)),
          const TextField(decoration: InputDecoration(hintText: 'Masukkan nama', border: OutlineInputBorder())),
          const SizedBox(height: 15),

          // Dropdown 
          const Text('Program Studi', style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            initialValue: _selectedProdi,
            hint: const Text('Pilih Program Studi'),
            onChanged: (String? newValue) {
              setState(() {
                _selectedProdi = newValue;
              });
            },
            items: <String>['Informatika', 'Sistem Informasi', 'Teknik Industri', 'Arsitektur']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 15),

          // Radio Button 
          const Text('Jenis Kelamin', style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              Radio<String>(
                value: 'Laki-laki',
                groupValue: _jenisKelamin,
                onChanged: (String? value) { setState(() { _jenisKelamin = value; }); },
              ),
              const Text('Laki-laki'),
              Radio<String>(
                value: 'Perempuan',
                groupValue: _jenisKelamin,
                onChanged: (String? value) { setState(() { _jenisKelamin = value; }); },
              ),
              const Text('Perempuan'),
            ],
          ),
          const SizedBox(height: 15),

          // Calendar Input 
          const Text('Tanggal Lahir', style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '${_tanggalLahir.day}/${_tanggalLahir.month}/${_tanggalLahir.year}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today),
                label: const Text('Pilih Tanggal'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('*Data tidak disimpan ke database ', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
        ],
      ),
    );
  }
}