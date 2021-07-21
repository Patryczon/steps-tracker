import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaloriesIndicator extends StatelessWidget {
  const CaloriesIndicator({Key? key, required this.caloriesBurnt})
      : assert(caloriesBurnt >= 0),
        super(key: key);

  final int caloriesBurnt;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Image.asset('assets/images/flame.png'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              caloriesBurnt.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Text(
            'Kalorien',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      );
}
