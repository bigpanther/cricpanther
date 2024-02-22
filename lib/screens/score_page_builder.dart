import 'package:cricpanther/match/player_picker.dart';
import 'package:cricpanther/screens/score_page.dart';
import 'package:cricpanther/scoresheet/scoresheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cricpanther/match/match.dart';

class ScorePageBuilder extends StatelessWidget {
  static const String routeName = '/scorepage';
  const ScorePageBuilder({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Scoresheet>(
        create: (context) {
          var match = Provider.of<Match>(context, listen: false);
          var batPicker = PlayerPicker(match.battingTeam!.players);
          var ballPicker = PlayerPicker(match.bowlingTeam.players);
          return Scoresheet(batPicker: batPicker, ballPicker: ballPicker);
        },
        child: ScorePage(title: title));
  }
}
