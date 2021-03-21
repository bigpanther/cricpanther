import 'package:cricpanther/match/match.dart';
import 'package:cricpanther/screens/match_create.dart';
import 'package:cricpanther/screens/score_page_builder.dart';
import 'package:cricpanther/screens/scorecard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Match>(
      create: (_) => new Match(),
      child: MaterialApp(
          title: 'Cricket Scorer',
          initialRoute: '/',
          routes: {
            ScorePageBuilder.routeName: (context) =>
                ScorePageBuilder(title: 'Scoresheet'),
            Scorecard.routeName: (context) => Scorecard(title: 'Scorecard'),
            // MatchMeta.routeName: (context) => MatchMeta(
            //     title: 'Match Info',
            //     match: ModalRoute.of(context).settings.arguments),
          },
          theme: ThemeData.dark(
              //primarySwatch: Colors.purple,
              ),
          home: MatchCreate(title: 'Start Match')),
    );
  }
}
