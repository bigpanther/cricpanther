import 'package:cricket_scorer/game/game.dart';
import 'package:cricket_scorer/screens/game_create.dart';
import 'package:cricket_scorer/screens/game_meta.dart';
import 'package:cricket_scorer/screens/score_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
const _defaultHomeTeamName = "Home Team";
const _defaultAwayTeamName = "Away Team";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Game>(
      create: (_) => new Game(_defaultHomeTeamName, _defaultAwayTeamName),
      child: MaterialApp(
          title: 'Cricket Scorer',
          initialRoute: '/',
          routes: {
            // When navigating to the "/second" route, build the SecondScreen widget.
            ScorePageBuilder.routeName: (context) =>
                ScorePageBuilder(title: 'Scoresheet'),
            GameMeta.routeName: (context) => GameMeta(
                title: 'Game Info',
                game: ModalRoute.of(context).settings.arguments),
          },
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: GameCreate(title: 'Start Game')),
    );
  }
}
