import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './input.dart';
import './convert.dart';
import './result.dart';

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
  double _kelvinResult = 0;
  double _reamurResult = 0;

  final _celciusNumber = TextEditingController();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Result('Kelvin', _kelvinResult),
                      Result('Reamur', _reamurResult),
                    ],
                  ),
                  Convert(convert),
                ]),
          ),
        ));
  }

  void convert() {
    setState(() {
      _kelvinResult = double.parse(_celciusNumber.text) - 273;
      _reamurResult = (4 / 5) * double.parse(_celciusNumber.text);
    });
  }
}
