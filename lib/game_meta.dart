import 'package:flutter/material.dart';

import 'package:cricket_scorer/game/game.dart';
import 'package:cricket_scorer/game/team.dart';
import 'package:cricket_scorer/game/player.dart';
import 'main.dart';

class GameMeta extends StatefulWidget {
  static final routeName = "/gameMeta";
  final String title;
  final Game game;
  GameMeta({Key key, this.title, this.game}) : super(key: key);
  @override
  GameMetaState createState() {
    return GameMetaState(game);
  }
}

class GameMetaState extends State<GameMeta> {
  final Game game;
  GameMetaState(this.game) {
    print("game state created");
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
            buildTeamList(context, game.homeTeam),
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
            buildTeamList(context, game.awayTeam),
            Column(children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Scoresheet.routeName,
                      arguments: game);
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
