import 'package:flutter/material.dart';
class card extends StatelessWidget {
  card({@required this.cor, this.childCard, this.detector});
  final Color cor;
  final Widget childCard;
  final Function detector;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: detector,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cor,
        ),
      ),
    );
  }
}

