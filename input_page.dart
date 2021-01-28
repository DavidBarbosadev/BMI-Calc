
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'resultpage.dart';
import 'calculo.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 25;

  /*void updateGender(Gender selectGender){
    if (selectGender == Gender.male){
      if (maleCardColor == coresInactivas){
        maleCardColor = coresAtivas;
      }else{
        maleCardColor = coresInactivas;
      }
    }
    if (selectGender == Gender.female){
      if (femaleCardColor == coresInactivas){
        femaleCardColor = coresAtivas;
      }else{
        femaleCardColor = coresInactivas;
      }
    }
    if(selectGender == Gender.male){
      femaleCardColor = coresInactivas;
    }else{
      maleCardColor = coresInactivas;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: card(
                  detector: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cor: selectedGender == Gender.male
                      ? coresAtivas
                      : coresInactivas,
                  childCard: childCardWidget(
                    icone: FontAwesomeIcons.mars,
                    label: "Male",
                  ),
                ),
              ),
              Expanded(
                child: card(
                  detector: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cor: selectedGender == Gender.female
                      ? coresAtivas
                      : coresInactivas,
                  childCard: childCardWidget(
                    icone: FontAwesomeIcons.venus,
                    label: "Female",
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: card(
                    cor: coresAtivas,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: cardstyle),
                            Text(" cm", style: labelTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.cyanAccent,
                            thumbColor: Colors.tealAccent,
                            overlayColor: Colors.white,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 18.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                          ),
                          child: Slider(
                            min: 100.0,
                            max: 220.0,
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            activeColor: Colors.cyanAccent,
                            inactiveColor: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: card(
                    cor: coresAtivas,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[  Text(
                        "AGE",
                        style: labelTextStyle,
                      ),
                        Text(age.toString(), style: cardstyle,),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )

                      ],
                    )
                  ),
                ),
                Expanded(
                  child: card(
                    cor: coresAtivas,
                    childCard: (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(weight.toString(), style: cardstyle,),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                              setState(() {
                                weight++;
                              });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            ),
                          ],
                        )



                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
          buttonResult(buttonTitle: "Calculate", ontap: (){
            Calculator calc = Calculator(height: height,weight: weight);

            Navigator.push(context, MaterialPageRoute(builder:(context){
              return ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              );
            }));
          },),
        ],
      ),
    );
  }
}

class buttonResult extends StatelessWidget {
  buttonResult({this.buttonTitle, this.ontap});
  final String buttonTitle;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child:Column(
        children: <Widget>[
        Container(
          child: Center(child: Text(buttonTitle, style: buttonResults,)),
          color: Colors.cyanAccent,
          padding: EdgeInsets.only(bottom: 20.0),
          height: bottomcontainerheight,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20.0),
        ),
      ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  @override

  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Color (0x0FF28313b)),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 50.0 , height: 50.0),
      shape: CircleBorder(),
      fillColor: Colors.cyanAccent,
      elevation: 16.0,

    );
  }
}
