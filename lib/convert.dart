import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Convert extends StatelessWidget {
  final VoidCallback _convert;

  Convert(this._convert);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 30),
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        primary: Colors.blue,
      ),
      onPressed: _convert,
      child: const Text(
        'Konversi Suhu',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
