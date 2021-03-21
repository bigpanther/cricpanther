import 'package:cricpanther/match/player.dart';
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
      '${bowler.bowlingStats.oversBowled}-${bowler.bowlingStats.maidens}-${bowler.bowlingStats.runs}-${bowler.bowlingStats.wickets}',
    ),
  ]);
}
