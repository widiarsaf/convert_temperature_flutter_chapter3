
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                  Input(celciusNumber: _celciusNumber),
                  Result(),
                  Convert(convert1Handler: _convert),
                ]),
          ),
        ));
  }

  void _convert() {
    setState(() {
      _kelvinResult = double.parse(_celciusNumber.text) - 273;
      _reamurResult = (4 / 5) * double.parse(_celciusNumber.text);
    });
  }
}

class Convert extends StatelessWidget {
  const Convert({
    Key? key,
    @required convert1Handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 30),
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        primary: Colors.blue,
      ),
      onPressed: () {},
      child: const Text(
        'Konversi Suhu',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    @required convert1Handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: [
              Text('Suhu dalam Kelvin'),
              Text(
                '0',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: [
              const Text('Suhu dalam Reamur'),
              Text(
                '0',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required TextEditingController celciusNumber,
  })  : _celciusNumber = celciusNumber,
        super(key: key);

  final TextEditingController _celciusNumber;

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
