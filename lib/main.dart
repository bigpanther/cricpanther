import 'package:cricket_scorer/scoresheet.dart';
import 'package:flutter/material.dart';
import 'game/game.dart';
import 'game_create.dart';
import 'game_meta.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cricket Scorer',
      initialRoute: '/',
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        Scoresheet.routeName: (context) => Scoresheet(
            title: 'Scorer', game: ModalRoute.of(context).settings.arguments),
        GameMeta.routeName: (context) => GameMeta(
            title: 'Game Info',
            game: ModalRoute.of(context).settings.arguments),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: GameCreate(title: 'Start Game'),
    );
  }
}
