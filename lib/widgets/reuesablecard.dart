import 'package:flutter/material.dart';

class ReuesableCard extends StatelessWidget {
  ReuesableCard({required this.colors, this.CardChild, this.onpress});
  final Color colors;
  final Widget? CardChild;
  final void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: CardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(10.5)),
      ),
    );
  }
}
