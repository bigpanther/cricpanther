import 'package:cricket_scorer/scoresheet/scoresheet.dart';
import 'package:flutter/material.dart';

Widget scoreboard(Scoresheet scoresheet, BuildContext context) {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(children: [
        if (scoresheet.target > 0)
          Text.rich(TextSpan(
            children: <InlineSpan>[
              TextSpan(text: 'Target: ${scoresheet.target}'),
            ],
            style: Theme.of(context).textTheme.body1,
          )),
        Text.rich(TextSpan(
          children: <InlineSpan>[
            TextSpan(text: scoresheet.currentRuns.toString()),
            TextSpan(text: '/'),
            TextSpan(text: scoresheet.currentWickets.toString()),
          ],
          style: Theme.of(context).textTheme.display4,
        )),
        Text.rich(TextSpan(
          children: <InlineSpan>[
            TextSpan(text: '('),
            TextSpan(text: scoresheet.overs()),
            TextSpan(text: ')'),
          ],
          style: Theme.of(context).textTheme.display2,
        )),
      ]),
    ),
  );
}
