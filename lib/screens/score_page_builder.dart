import 'package:cricket_scorer/game/player_picker.dart';
import 'package:cricket_scorer/screens/score_page.dart';
import 'package:cricket_scorer/scoresheet/scoresheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cricket_scorer/game/game.dart';

class ScorePageBuilder extends StatelessWidget {
  static final String routeName = '/scorepage';
  ScorePageBuilder({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Scoresheet>(
        create: (context) {
          var game = Provider.of<Game>(context, listen: false);
          var batPicker = PlayerPicker(game.battingTeam.players);
          var ballPicker = PlayerPicker(game.bowlingTeam.players);
          return Scoresheet(batPicker, ballPicker);
        },
        child: ScorePage(title: this.title));
  }
}
