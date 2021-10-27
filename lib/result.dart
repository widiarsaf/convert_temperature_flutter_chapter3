import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatelessWidget {
  final String title;
  final double result;

  Result(this.title, this.result);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          Text(title),
          Text(
            result.toString(),
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }
}
