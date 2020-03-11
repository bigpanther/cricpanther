import 'package:cricket_scorer/match/player.dart';
import 'package:flutter/material.dart';

Widget bowlerSummary(Player bowler, bool onStrike) {
  var strikeText = '';
  if (onStrike) {
    strikeText = '*';
  }
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(
      '${bowler.name}$strikeText',
    ),
    Text(
      '${bowler.oversBowled}-${bowler.maidensBowled}-${bowler.runsConceded}-${bowler.wicketsTaken}',
    ),
  ]);
}
