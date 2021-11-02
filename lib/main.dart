import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './input.dart';
import './convert.dart';
import './result.dart';
import './history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputCelcius = 0;
  String _selectedValue = "Kelvin";
  double _result = 0;

  final _celciusNumber = TextEditingController();
  List<String> listViewItem = [];

  var listItem = ["Kelvin", "Reamur", "Fahrenheit"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konversi Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Input(_celciusNumber),
                  DropdownButton<String>(
                    items: listItem.map((String temperature) {
                      return DropdownMenuItem<String>(
                        value: temperature,
                        child: Text(temperature),
                      );
                    }).toList(),
                    value: _selectedValue,
                    onChanged: (val) {
                      changeDropdownValue(val);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Result(_result)],
                  ),
                  Convert(convert),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      "Riwayat Konversi",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: History(listViewItem),
                  ),
                ]),
          ),
        ));
  }

  void convert() {
    setState(() {
      _inputCelcius = double.parse(_celciusNumber.text);

      if (_selectedValue == 'Kelvin') {
        _result = _inputCelcius + 273;
        listViewItem.add('Kelvin: ' + _result.toStringAsFixed(2));
      } else if (_selectedValue == 'Reamur') {
        _result = 4 / 5 * _inputCelcius;
        listViewItem.add('Reamur: ' + _result.toStringAsFixed(2));
      } else if (_selectedValue == 'Fahrenheit') {
        _result = 9 / 5 * _inputCelcius + 32;
        listViewItem.add('Fahrenheit: ' + _result.toStringAsFixed(2));
      }
    });
  }

  void changeDropdownValue(val) {
    setState(() {
      _selectedValue = val;
    });
    convert();
  }
}
