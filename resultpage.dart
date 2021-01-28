import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'input_page.dart';


class ResultsPage extends StatelessWidget {


  ResultsPage(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                "Your Results",
                style: cardstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: card(
              cor: coresAtivas,
              childCard: (Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(resultText, style: resultslabel,),
                  Text(bmiResult, style: resultsValue,),
                  Text(interpretation, style: explicacao,),
                 ],
              )),
            ),
          ),
          buttonResult(buttonTitle: "Home", ontap: () {
            Navigator.pop(
                (context));
          },
          )
        ],
      ),
    );
  }
}
