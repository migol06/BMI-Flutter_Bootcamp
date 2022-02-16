import 'package:bmi_calc/color.dart';
import 'package:bmi_calc/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container.dart';
import 'gender.dart';

enum Gender { male, female }
Gender? selectGender;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 0;
  int age = 0;
  int height = 180;
  Color maleColor = BMIColor.inaactiveColor;
  Color femaleColor = BMIColor.inaactiveColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          backgroundColor: BMIColor.black,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMIContainer(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    color: selectGender == Gender.male
                        ? BMIColor.activeColor
                        : BMIColor.inaactiveColor,
                    child: const BMIGender(
                        desc: 'MALE', iconData: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: BMIContainer(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    color: selectGender == Gender.female
                        ? BMIColor.activeColor
                        : BMIColor.inaactiveColor,
                    child: const BMIGender(
                        desc: 'FEMALE', iconData: FontAwesomeIcons.venus),
                  ),
                )
              ],
            ),
          ),
          BMIContainer(
            color: BMIColor.inaactiveColor,
            child: Column(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMIContainer(
                    color: BMIColor.inaactiveColor,
                    child: BMIHeightAge(
                        desc: 'WEIGHT',
                        onTapAdd: () {
                          setState(() {
                            weight++;
                            debugPrint(weight.toString());
                          });
                        },
                        onTapMinus: () {
                          setState(() {
                            weight--;
                            debugPrint(weight.toString());
                          });
                        },
                        number: weight.toString()),
                  ),
                ),
                Expanded(
                  child: BMIContainer(
                    color: BMIColor.inaactiveColor,
                    child: BMIHeightAge(
                        desc: 'AGE',
                        onTapAdd: () => setState(() {
                              age++;
                            }),
                        onTapMinus: () => setState(() {
                              age--;
                            }),
                        number: age.toString()),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}

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
          style: const TextStyle(
              fontSize: 18.0,
              color: BMIColor.gray,
              fontWeight: FontWeight.bold),
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
                  padding: const EdgeInsets.all(15)),
            ),
            const SizedBox(
              width: 10.0,
            ),
            ElevatedButton(
              onPressed: onTapAdd,
              child: const Icon(FontAwesomeIcons.plus),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15.0)),
            )
          ],
        )
      ],
    );
  }
}
