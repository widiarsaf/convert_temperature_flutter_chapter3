import 'package:flutter/material.dart';

class History extends StatelessWidget {
  List<String> listTemperature = [];
  History(this.listTemperature);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listTemperature.map((String value) {
        return Container(
          margin: EdgeInsets.all(8),
          child: Text(
            value,
            style: TextStyle(fontSize: 15),
          ),
        );
      }).toList(),
    );
  }
}
