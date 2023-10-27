import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onpress});
  final IconData icon;
  final void Function() onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onpress,
        elevation: 6.0,
        disabledElevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E));
  }
}
