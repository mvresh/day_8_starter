import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:day_8_starter/results_page.dart';
import 'package:day_8_starter/reusable_card.dart';
import 'package:day_8_starter/round_button.dart';

double bmi;
Color bmiStatusColor;
String contentFiller;
String bmiStatus;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }
const TextStyle kNumberLabelTextStyle =
    TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
const TextStyle kLabelTextStyle =
    TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 1.15);

class _InputPageState extends State<InputPage> {
  double height = 183;
  int weight = 63;
  int age = 25;
  Gender gender; // Male = 0, Female = 1
  Color activeCardColor = Color(0xFF1D1F31);
  Color inactiveCardColor = Color(0xFF111328);
  Color activeColor = Colors.white;
  Color inactiveColor = Colors.white.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars,
                            size: 50,
                            color: gender == Gender.male
                                ? activeColor
                                : inactiveColor),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              fontSize: 20,
                              color: gender == Gender.male
                                  ? activeColor
                                  : inactiveColor),
                        )
                      ],
                    ),
                    color: gender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.male;
                      });
                      print('Male selected');
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.venus,
                            size: 50,
                            color: gender == Gender.female
                                ? activeColor
                                : inactiveColor),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                              fontSize: 20,
                              color: gender == Gender.female
                                  ? activeColor
                                  : inactiveColor),
                        )
                      ],
                    ),
                    color: gender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.female;
                      });

                      print('Female selected');
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '${height}',
                        style: kNumberLabelTextStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white60,
                      trackHeight: 2.0,
                      thumbColor: Colors.pink,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayColor: Colors.pinkAccent.withOpacity(0.5),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      onChanged: (newHeight) {
                        setState(() {
                          height = newHeight;
                        });
                      },
                      value: height,
                      min: 100,
                      max: 250,
                      divisions: 150,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundButton(
                                Icon(
                                  Icons.add,
                                  size: 32,
                                ), () {
                              setState(() {
                                weight++;
                              });
                            }),
                            RoundButton(
                                Icon(
                                  Icons.remove,
                                  size: 32,
                                ), () {
                              setState(() {
                                weight--;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        '$age',
                        style: kNumberLabelTextStyle,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundButton(
                              Icon(
                                Icons.add,
                                size: 32,
                              ), () {
                            setState(() {
                              age++;
                            });
                          }),
                          RoundButton(
                              Icon(
                                Icons.remove,
                                size: 32,
                              ), () {
                            setState(() {
                              age--;
                            });
                          }),
                        ],
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: 40,
              child: FlatButton(
                onPressed: () {
                  double bmi = weight / ((height/100)*(height/100));
                  if(bmi < 18.5){
                    bmiStatus = 'LOW';
                    bmiStatusColor = Colors.red;
                    contentFiller = 'Go out and eat till the Sun Dies';
                  }
                  else if(bmi >= 18.5 && bmi <= 25){
                    bmiStatus = 'NORMAL';
                    bmiStatusColor = Colors.green;
                    contentFiller = 'You have a normal body weight. Good job!';
                  }
                  else if(bmi > 25){
                    bmiStatus = 'HIGH';
                    bmiStatusColor = Colors.red;
                    contentFiller = 'Gym Sleep Gym Repeat';
                  }
                  print('$bmi');
                  print(bmiStatus);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultsPage(bmi,bmiStatus,contentFiller,bmiStatusColor)));
                },
                child: Text('CALCULATE YOUR BMI',style: TextStyle(fontSize: 20,letterSpacing: 1.15),),
                color: Color(0XFFEB1555),
              ))
        ],
      ),
    );
  }
}
