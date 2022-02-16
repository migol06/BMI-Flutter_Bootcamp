import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants/constants.dart';
import 'widgets/widgets.dart';

enum Gender { male, female }
Gender? selectGender;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 50;
  int age = 20;
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
        body: Column(children: [
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
            color: BMIColor.activeColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'HEIGHT',
                  style: labelTextStyle,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: numberTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: numberTextStyle,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: BMIColor.gray,
                      activeTrackColor: Colors.white,
                      thumbColor: BMIColor.bottomContainerColor,
                      overlayColor: BMIColor.lowPink,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                      min: 100,
                      max: 220,
                      value: height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      }),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMIContainer(
                    color: BMIColor.activeColor,
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
                    color: BMIColor.activeColor,
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
          ),
          Container(
            width: double.infinity,
            height: 70.0,
            margin: const EdgeInsets.only(top: 5.0),
            decoration:
                const BoxDecoration(color: BMIColor.bottomContainerColor),
            child: const Center(
              child: Text(
                'Calculate',
                style: largeButtonStyle,
              ),
            ),
          )
        ]));
  }
}
