import 'package:flutter/material.dart';

class childCardWidget extends StatelessWidget {

  childCardWidget({@required this.icone, @required this.label});

  final IconData icone;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icone,
          color: Colors.cyanAccent,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.cyanAccent,
          ),),
      ],
    );
  }
}