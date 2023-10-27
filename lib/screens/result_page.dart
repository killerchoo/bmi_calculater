import 'package:bmi_calculater/widgets/bottombutton.dart';
import 'package:bmi_calculater/widgets/constance.dart';
import 'package:bmi_calculater/widgets/reuesablecard.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.result,
      required this.resulttext,
      required this.resulttip});

  final String result;
  final String resulttext;
  final String resulttip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: commenstyle,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'YOUR RESULT',
                    style: lablestyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuesableCard(
                  colors: Color(
                    0xFF1D1E33,
                  ),
                  CardChild: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          resulttext,
                          style: Ktextstyle,
                        ),
                        Text(result, style: kBMItextStyle),
                        Text(
                          resulttip,
                          style: kBMIundetext,
                        ),
                        BottemButton(
                            onpress: () {
                              Navigator.of(context).pop();
                            },
                            title: 'RE-CALCULTE')
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
