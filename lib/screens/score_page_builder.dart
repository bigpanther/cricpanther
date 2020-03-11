import 'package:cricket_scorer/match/player_picker.dart';
import 'package:cricket_scorer/screens/score_page.dart';
import 'package:cricket_scorer/scoresheet/scoresheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cricket_scorer/match/match.dart';

class ScorePageBuilder extends StatelessWidget {
  static final String routeName = '/scorepage';
  ScorePageBuilder({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Scoresheet>(
        create: (context) {
          var match = Provider.of<Match>(context, listen: false);
          var batPicker = PlayerPicker(match.battingTeam.players);
          var ballPicker = PlayerPicker(match.bowlingTeam.players);
          return Scoresheet(batPicker, ballPicker);
        },
        child: ScorePage(title: this.title));
  }
}
