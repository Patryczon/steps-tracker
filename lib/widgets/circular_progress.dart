import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key, required this.percentage})
      : assert((percentage ?? 0) >= 0),
        super(key: key);

  final double? percentage;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: CircularPercentIndicator(
          animation: true,
          animateFromLastPercent: true,
          radius: 250,
          lineWidth: 12,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.5),
          percent: (percentage ?? 0) > 1 ? 1 : percentage?.toDouble() ?? 0,
          center: Text(
            '${((percentage ?? 0) * 100.0).roundToDouble().toStringAsFixed(0)}'
            '%',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );
}
