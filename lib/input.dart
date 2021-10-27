import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final TextEditingController _celciusNumber;

  Input(this._celciusNumber);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan suhu terlebih  dahulu';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Masukkan suhu dalam celcius',
      ),
      controller: _celciusNumber,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
