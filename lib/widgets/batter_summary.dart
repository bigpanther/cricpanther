import 'package:cricket_scorer/game/player.dart';
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
      '${player.runsScored}(${player.ballsFaced})',
    ),
  ]);
}
