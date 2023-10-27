import 'package:bmi_calculater/widgets/constance.dart';
import 'package:flutter/cupertino.dart';

class IconContant extends StatelessWidget {
  const IconContant(this.icon, this.label);
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Color(0XFFFFFFFF),
        ),
        SizedBox(
          height: 30,
        ),
        Text(label, style: lablestyle)
      ],
    );
  }
}
