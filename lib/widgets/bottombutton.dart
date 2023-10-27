import 'package:bmi_calculater/widgets/constance.dart';
import 'package:flutter/material.dart';

class BottemButton extends StatelessWidget {
  const BottemButton({required this.onpress, required this.title});

  final void Function() onpress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
          height: 70,
          width: double.infinity,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: Colors.teal),
          child: Center(
              child: Text(
            title,
            style: commenstyle,
          ))),
    );
  }
}
