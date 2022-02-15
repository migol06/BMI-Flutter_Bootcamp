import 'package:bmi_calc/color.dart';
import 'package:bmi_calc/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container.dart';
import 'gender.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 0;
  int age = 0;
  Color maleColor = BMIColor.inactiveColor;
  Color femaleColor = BMIColor.inactiveColor;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleColor == BMIColor.inactiveColor) {
        maleColor = BMIColor.activeColor;
      } else {
        maleColor = BMIColor.inactiveColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleColor == BMIColor.inactiveColor) {
        femaleColor = BMIColor.activeColor;
      } else {
        femaleColor = BMIColor.inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          backgroundColor: BMIColor.black,
        ),
        body: Column(children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMIContainer(
                    color: maleColor,
                    child: const BMIGender(
                        desc: 'MALE', iconData: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: BMIContainer(
                    color: femaleColor,
                    child: const BMIGender(
                        desc: 'FEMALE', iconData: FontAwesomeIcons.venus),
                  ),
                )
              ],
            ),
          ),
          BMIContainer(
            color: BMIColor.inactiveColor,
            child: Column(),
          ),
          // Expanded(
          //   child: Row(
          //     children: [
          //       BMIContainer(
          //         color: BMIColor.inactiveColor,
          //         child: getHeightColumn('WEIGHT', () {
          //           setState(() {
          //             weight++;
          //             debugPrint(weight.toString());
          //           });
          //         }, () {
          //           setState(() {
          //             weight--;
          //             debugPrint(weight.toString());
          //           });
          //         }, weight.toString()),
          //       ),
          //       BMIContainer(
          //         color: BMIColor.inactiveColor,
          //         child: getHeightColumn(
          //             'AGE',
          //             () => setState(() {
          //                   age++;
          //                 }),
          //             () => setState(() {
          //                   age--;
          //                 }),
          //             age.toString()),
          //       )
          //     ],
          //   ),
          // )
        ]));
  }

  // Column getHeightColumn(String desc, VoidCallback onTapAdd,
  //     VoidCallback onTapMinus, String number) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text(
  //         desc,
  //         style: const TextStyle(
  //             fontSize: 18.0,
  //             color: BMIColor.gray,
  //             fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(
  //         height: 10.0,
  //       ),
  //       Text(
  //         number,
  //         style: numberTextStyle,
  //       ),
  //       const SizedBox(
  //         height: 10.0,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           ElevatedButton(
  //             onPressed: onTapMinus,
  //             child: const Icon(FontAwesomeIcons.minus),
  //             style: ElevatedButton.styleFrom(
  //                 shape: const CircleBorder(),
  //                 padding: const EdgeInsets.all(15)),
  //           ),
  //           const SizedBox(
  //             width: 10.0,
  //           ),
  //           ElevatedButton(
  //             onPressed: onTapAdd,
  //             child: const Icon(FontAwesomeIcons.plus),
  //             style: ElevatedButton.styleFrom(
  //                 shape: const CircleBorder(),
  //                 padding: const EdgeInsets.all(15.0)),
  //           )
  //         ],
  //       )
  //     ],
  //   );
  // }
}
