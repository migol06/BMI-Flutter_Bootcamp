import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'widgets/widgets.dart';

class BMIResultsPage extends StatelessWidget {
  final String result;
  final String bmi;
  final String bmiDescription;

  const BMIResultsPage(
      {Key? key,
      required this.result,
      required this.bmi,
      required this.bmiDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: BMIColor.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Your Result',
            style: numberTextStyle,
          ),
          Expanded(
            child: BMIContainer(
              color: BMIColor.activeColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmi,
                    style: resultTextStyle,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    result,
                    style: resultNumberTextStyle,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bmiDescription,
                      style: labelTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 70.0,
              margin: const EdgeInsets.only(top: 5.0),
              decoration:
                  const BoxDecoration(color: BMIColor.bottomContainerColor),
              child: const Center(
                child: Text(
                  'Re-Calculate',
                  style: largeButtonStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
