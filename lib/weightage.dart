import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'color.dart';
import 'constant.dart';

class BMIHeightAge extends StatelessWidget {
  const BMIHeightAge({
    Key? key,
    required this.desc,
    required this.onTapAdd,
    required this.onTapMinus,
    required this.number,
  }) : super(key: key);

  final String desc;
  final VoidCallback onTapAdd;
  final VoidCallback onTapMinus;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          desc,
          style: labelTextStyle,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          number,
          style: numberTextStyle,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onTapMinus,
              child: const Icon(FontAwesomeIcons.minus),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  primary: BMIColor.grayButton),
            ),
            const SizedBox(
              width: 10.0,
            ),
            ElevatedButton(
              onPressed: onTapAdd,
              child: const Icon(FontAwesomeIcons.plus),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15.0),
                  primary: BMIColor.grayButton),
            )
          ],
        )
      ],
    );
  }
}
