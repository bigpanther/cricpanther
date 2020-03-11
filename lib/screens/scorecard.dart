import 'package:cricket_scorer/match/match.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scorecard extends StatelessWidget {
  static final String routeName = '/scorecard';
  final String title;
  Scorecard({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var match = Provider.of<Match>(context);
    print('build scorecard');
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from thre ScorePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(this.title),
          bottom: TabBar(
            tabs: [
              Text(match.battingTeam.name),
              Text(match.bowlingTeam.name),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('Batting team'),
            Text('Bowling team'),
          ],
        ),
      ),
      length: 2,
    );
  }
}
