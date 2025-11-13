import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String _displayResult = "0"; // Hasil akhir yang ditampilkan di layar besar
  String _currentNumber = ""; // Angka yang sedang diinput oleh pengguna
  String _history = ""; // Untuk menampilkan riwayat operasi (opsional)
  double num1 = 0.0;
  String operand = "";
  // Variabel _isOperandPressed telah dihapus karena tidak digunakan.

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") { // Tombol Clear
        _currentNumber = "";
        num1 = 0.0;
        operand = "";
        _displayResult = "0";
        _history = "";
      } else if (buttonText == "⌫") { // Tombol Backspace (Opsional, untuk hapus satu karakter)
        if (_currentNumber.isNotEmpty) {
          _currentNumber = _currentNumber.substring(0, _currentNumber.length - 1);
          _displayResult = _currentNumber.isEmpty ? "0" : _currentNumber;
        }
      } else if (buttonText == "." && _currentNumber.contains(".")) {
        return;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") { // Operasi dasar
        if (_currentNumber.isEmpty) return;
        
        num1 = double.parse(_currentNumber);
        operand = buttonText;
        _history = "${num1.toStringAsFixed(num1.truncateToDouble() == num1 ? 0 : 2)} $operand";
        _currentNumber = "";
        _displayResult = num1.toStringAsFixed(num1.truncateToDouble() == num1 ? 0 : 2); // Tampilkan num1 sebelum input num2
      
      } else if (buttonText == "=") {
        if (_currentNumber.isEmpty || operand.isEmpty) return;
        double num2 = double.parse(_currentNumber);
        double result = 0.0;

        if (operand == "+") result = num1 + num2;
        if (operand == "-") result = num1 - num2;
        if (operand == "×") result = num1 * num2;
        if (operand == "÷") result = num1 / num2;

        _displayResult = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 4);
        _history = "$num1 $operand $num2 =";
        
        // Reset untuk operasi berikutnya
        num1 = result;
        operand = "";
        _currentNumber = "";
        
      } else if (buttonText == "x²") { // Kuadrat 
        if (_displayResult == "0") return;
        double num = double.parse(_currentNumber.isNotEmpty ? _currentNumber : _displayResult);
        double result = num * num;
        
        _history = "($num)²";
        _displayResult = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 4);
        _currentNumber = _displayResult;

      } else if (buttonText == "√") { // Akar Kuadrat 
        if (_displayResult == "0") return;
        double num = double.parse(_currentNumber.isNotEmpty ? _currentNumber : _displayResult);
        double result = sqrt(num);

        _history = "√($num)";
        _displayResult = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 4);
        _currentNumber = _displayResult;

      } else {
        // Angka atau Titik
        _currentNumber += buttonText;
        _displayResult = _currentNumber;
      }
    });
  }

  // Widget untuk membangun tombol
  Widget _buildButton(String buttonText, {Color buttonColor = const Color(0xFFF3F3F3), Color textColor = Colors.black}) {
    // Tentukan warna khusus untuk operator dan hapus
    Color calculatedColor = buttonColor;
    if (buttonText == "C" || buttonText == "⌫") {
      calculatedColor = Colors.red.shade100;
      textColor = Colors.red.shade700;
    } else if (buttonText == "÷" || buttonText == "×" || buttonText == "-" || buttonText == "+" || buttonText == "=" || buttonText == "x²" || buttonText == "√") {
      calculatedColor = Colors.indigo.shade100;
      textColor = Colors.indigo.shade700;
    }

    // Ubah warna angka ke abu-abu gelap
    if (int.tryParse(buttonText) != null || buttonText == '.') {
      calculatedColor = Colors.grey.shade300;
      textColor = Colors.black87;
    }
    
    // Tombol sama dengan
    if (buttonText == "=") {
      calculatedColor = Colors.indigo.shade700;
      textColor = Colors.white;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: calculatedColor,
            elevation: 0,
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // Sudut lebih melengkung
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: textColor),
          ),
          onPressed: () => _buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Output Display Area
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // History (Opsional)
                Text(
                  _history,
                  style: TextStyle(fontSize: 24.0, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 10),
                // Display Result
                Text(
                  _displayResult,
                  style: const TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold, color: Colors.black87),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),

        // Tombol-tombol Kalkulator
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Column(
            children: <Widget>[
              // Baris 1: Clear, Operasi Khusus, Bagi
              Row(
                children: <Widget>[
                  _buildButton("C"),
                  _buildButton("x²"),
                  _buildButton("√"),
                  _buildButton("÷"),
                ],
              ),
              // Baris 2: 7, 8, 9, Kali
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("×"),
                ],
              ),
              // Baris 3: 4, 5, 6, Kurang
              Row(
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("-"),
                ],
              ),
              // Baris 4: 1, 2, 3, Tambah
              Row(
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("+"),
                ],
              ),
              // Baris 5: Backspace, 0, Titik, Sama Dengan
              Row(
                children: <Widget>[
                  _buildButton("⌫"), // Backspace
                  _buildButton("0"),
                  _buildButton("."),
                  _buildButton("="),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}