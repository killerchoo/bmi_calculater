import 'package:bmi_calculater/functions/calculater_function.dart';
import 'package:bmi_calculater/screens/result_page.dart';
import 'package:bmi_calculater/widgets/bottombutton.dart';
import 'package:bmi_calculater/widgets/constance.dart';
import 'package:bmi_calculater/widgets/iconcontant.dart';
import 'package:bmi_calculater/widgets/reuesablecard.dart';
import 'package:bmi_calculater/widgets/roundiconbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activecardcolors = Color(0xFF1D1E33);
const inactivecardcolors = Color(0xFF111328);

enum genter {
  male,
  female,
}

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 130;
  int weight = 60;
  int age = 20;
  Color malecardcolor = inactivecardcolors;

  Color femalecardcolor = inactivecardcolors;

  void Updatecolors(genter selectedgenter) {
    if (selectedgenter == genter.male) {
      if (malecardcolor == inactivecardcolors) {
        malecardcolor = activecardcolors;
        femalecardcolor = inactivecardcolors;
      } else {
        malecardcolor = inactivecardcolors;
      }
    }
    if (selectedgenter == genter.female) {
      if (femalecardcolor == inactivecardcolors) {
        malecardcolor = inactivecardcolors;
        femalecardcolor = activecardcolors;
      } else {
        femalecardcolor = inactivecardcolors;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReuesableCard(
                  onpress: () {
                    setState(() {
                      Updatecolors(genter.male);
                    });
                  },
                  colors: malecardcolor,
                  CardChild: IconContant(Icons.male, 'MALE'),
                )),
                Expanded(
                    child: ReuesableCard(
                        onpress: () {
                          setState(() {
                            Updatecolors(genter.female);
                          });
                        },
                        colors: femalecardcolor,
                        CardChild: IconContant(Icons.female, 'FEMALE')))
              ],
            )),
            Expanded(
                child: ReuesableCard(
              colors: activecardcolors,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: lablestyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 40),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'CM',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Colors.teal,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      })
                ],
              ),
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: ReuesableCard(
                  colors: activecardcolors,
                  CardChild: Column(
                    children: [
                      Text(
                        'WEIGHT',
                        style: lablestyle,
                      ),
                      Text(weight.toString(), style: commenstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: ReuesableCard(
                    colors: activecardcolors,
                    CardChild: Column(
                      children: [
                        Text(
                          'AGE',
                          style: lablestyle,
                        ),
                        Text(
                          age.toString(),
                          style: commenstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottemButton(
              onpress: () {
                calculaterFunc calc = calculaterFunc(height, weight);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: calc.CalculateBMI(),
                      resulttext: calc.GetResult(),
                      resulttip: calc.GetTips(),
                    ),
                  ),
                );
              },
              title: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
