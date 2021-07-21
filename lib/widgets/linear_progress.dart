import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:superloop/theme/app_colors.dart';

class LinearProgress extends StatelessWidget {
  const LinearProgress({Key? key, required this.percentage})
      : assert(percentage >= 0),
        super(key: key);
  final double percentage;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Icon(
                    Icons.tour,
                    color: darkBlue,
                  )),
            ),
          ),
          LinearPercentIndicator(
            percent: (percentage) > 1 ? 1 : percentage.toDouble(),
            lineHeight: 8,
            animateFromLastPercent: true,
            animation: true,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Theme.of(context).accentColor,
            backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.5),
          )
        ],
      );
}
