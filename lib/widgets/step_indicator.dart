import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator(
      {Key? key, required this.stepsCount, required this.stepsGoal})
      : assert(stepsCount >= 0),
        assert(stepsGoal >= 0),
        super(key: key);
  final int stepsCount;
  final int stepsGoal;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Image.asset('assets/images/steps.png'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              '$stepsCount / $stepsGoal',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Text(
            'Schritte',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      );
}
