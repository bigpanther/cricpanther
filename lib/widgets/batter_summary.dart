import 'package:cricpanther/match/player.dart';
import 'package:flutter/material.dart';

Widget batterSummary(Player player, bool onStrike) {
  var strikeText = '';
  if (onStrike) {
    strikeText = '*';
  }
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(
      '${player.name}$strikeText',
    ),
    Text(
      '${player.battingStats.runs}(${player.battingStats.balls})',
    ),
  ]);
}
