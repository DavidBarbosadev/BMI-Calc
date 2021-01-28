import 'package:flutter/material.dart';
import 'input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0x0FF28313b),
        primaryColor: Color(0x0FF28313b),
        scaffoldBackgroundColor: Colors.blueGrey,


      ),
      home: InputPage(),
    );
  }
}

