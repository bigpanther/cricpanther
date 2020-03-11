import 'package:cricket_scorer/match/match.dart';
import 'package:cricket_scorer/screens/match_create.dart';
import 'package:cricket_scorer/screens/match_meta.dart';
import 'package:cricket_scorer/screens/score_page_builder.dart';
import 'package:cricket_scorer/screens/scorecard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
const _defaultHomeTeamName = "Home Team";
const _defaultAwayTeamName = "Away Team";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Match>(
      create: (_) => new Match(_defaultHomeTeamName, _defaultAwayTeamName),
      child: MaterialApp(
          title: 'Cricket Scorer',
          initialRoute: '/',
          routes: {
            // When navigating to the "/second" route, build the SecondScreen widget.
            ScorePageBuilder.routeName: (context) =>
                ScorePageBuilder(title: 'Scoresheet'),
            Scorecard.routeName: (context) => Scorecard(title: 'Scorecard'),
            MatchMeta.routeName: (context) => MatchMeta(
                title: 'Match Info',
                match: ModalRoute.of(context).settings.arguments),
          },
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: MatchCreate(title: 'Start Match')),
    );
  }
}
