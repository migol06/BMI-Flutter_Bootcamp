import 'package:bmi_calc/constants/constants.dart';
import 'package:flutter/material.dart';

class BMIGender extends StatelessWidget {
  const BMIGender({
    Key? key,
    required this.desc,
    required this.iconData,
  }) : super(key: key);

  final String desc;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          desc,
          style: labelTextStyle,
        )
      ],
    );
  }
}
