import 'package:cricket_scorer/score_page_builder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game/game.dart';

class GameCreate extends StatefulWidget {
  final String title;

  GameCreate({Key key, this.title}) : super(key: key);
  @override
  GameCreateState createState() {
    return GameCreateState();
  }
}

class GameCreateState extends State<GameCreate> {
  final _formKey = GlobalKey<FormState>();
  String homeTeamName;
  String awayTeamName;
  @override
  Widget build(BuildContext context) {
    var game = Provider.of<Game>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(children: <Widget>[
                  TextFormField(
                    maxLength: 30,
                    autocorrect: false,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                      hintText: '${game.homeTeam.name} name',
                      labelText: '${game.homeTeam.name} Name *',
                      counterText: '',
                    ),
                    validator: (value) {
                      return checkRequired(value);
                    },
                    onSaved: (val) => setState(() => homeTeamName = val),
                  ),
                  TextFormField(
                    maxLength: 30,
                    autocorrect: false,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                      hintText: '${game.awayTeam.name} name',
                      labelText: '${game.awayTeam.name} Name *',
                      counterText: '',
                    ),
                    validator: (value) {
                      return checkRequired(value);
                    },
                    onSaved: (val) => setState(() => awayTeamName = val),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        game.homeTeam.name = homeTeamName;
                        game.awayTeam.name = awayTeamName;
                        game.start(game.awayTeam, game.awayTeam);
                        Navigator.pushReplacementNamed(
                            context, ScorePageBuilder.routeName);
                      }
                    },
                    child: Text('Start game'),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String checkRequired(String value) {
    if (value.isEmpty) {
      return 'Please enter team name';
    }
    return null;
  }
}
