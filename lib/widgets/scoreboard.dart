import 'package:cricpanther/scoresheet/scoresheet.dart';
import 'package:flutter/material.dart';

Widget scoreboard(Scoresheet scoresheet, BuildContext context) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        if (scoresheet.target > 0)
          Text.rich(TextSpan(
            children: <InlineSpan>[
              TextSpan(text: 'Target: ${scoresheet.target}'),
            ],
            style: Theme.of(context).textTheme.bodyMedium,
          )),
        Text.rich(TextSpan(
          children: <InlineSpan>[
            TextSpan(text: scoresheet.currentRuns.toString()),
            const TextSpan(text: '/'),
            TextSpan(text: scoresheet.currentWickets.toString()),
          ],
          style: Theme.of(context).textTheme.displayLarge,
        )),
        Text.rich(TextSpan(
          children: <InlineSpan>[
            const TextSpan(text: '('),
            TextSpan(text: scoresheet.overs()),
            const TextSpan(text: ')'),
          ],
          style: Theme.of(context).textTheme.displaySmall,
        )),
      ]),
    ),
  );
}
