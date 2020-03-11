import 'package:cricket_scorer/screens/score_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:cricket_scorer/match/match.dart';
import 'package:cricket_scorer/match/team.dart';
import 'package:cricket_scorer/match/player.dart';

class MatchMeta extends StatefulWidget {
  static final routeName = "/matchMeta";
  final String title;
  final Match match;
  MatchMeta({Key key, this.title, this.match}) : super(key: key);
  @override
  MatchMetaState createState() {
    return MatchMetaState(match);
  }
}

class MatchMetaState extends State<MatchMeta> {
  final Match match;
  MatchMetaState(this.match) {
    print("match state created");
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildTeamList(context, match.homeTeam),
            Column(
              children: <Widget>[
                Text(
                  "vs",
                  style: Theme.of(context)
                      .textTheme
                      .display2
                      .apply(color: Colors.purple),
                ),
              ],
            ),
            buildTeamList(context, match.awayTeam),
            Column(children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ScorePageBuilder.routeName,
                  );
                },
                child: Text('Start Scoring'),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Card buildTeamList(BuildContext context, Team team) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 500,
            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                var oldPlayer = team.players[oldIndex];
                setState(() {
                  team.players[oldIndex] = team.players[newIndex];
                  team.players[newIndex] = oldPlayer;
                });
              },
              header: Text(
                team.name,
                style: Theme.of(context).textTheme.headline,
              ),
              children: team.players
                  .map(
                    (p) => getRow(p, team),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Row getRow(Player p, Team team) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      key: ValueKey(p),
      children: <Widget>[
        Expanded(
          child: TextFormField(
            maxLength: 30,
            maxLengthEnforced: true,
            validator: (value) {
              return checkRequired(value);
            },
            decoration: const InputDecoration(
              counterText: '',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove),
                //onPressed: () { print("1")},
              ),
            ),
            readOnly: !p.isEditing,
            initialValue: p.name,
            onSaved: (val) => setState(() => team.name = val),
          ),
        ),
        RaisedButton(
          onPressed: () {
            setState(() => p.isEditing = true);
          },
          child: Text('Edit'),
        ),
      ],
    );
  }
}

String checkRequired(String value) {
  if (value.isEmpty) {
    return 'Please enter team name';
  }
  return null;
}
