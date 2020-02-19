import 'package:flutter/material.dart';

import 'game.dart';
import 'game_meta.dart';

const _defaultHomeTeamName = "Home Team";
const _defaultAwayTeamName = "Away Team";

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
              child: Column(children: <Widget>[
                TextFormField(
                  maxLength: 30,
                  autocorrect: false,
                  maxLengthEnforced: true,
                  decoration: const InputDecoration(
                    hintText: '$_defaultHomeTeamName name',
                    labelText: '$_defaultHomeTeamName Name *',
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
                  decoration: const InputDecoration(
                    hintText: '$_defaultAwayTeamName name',
                    labelText: '$_defaultAwayTeamName Name *',
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
                      Navigator.pushNamed(context, GameMeta.routeName,
                          arguments: Game(homeTeamName, awayTeamName));
                    }
                  },
                  child: Text('Start game'),
                ),
              ]),
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
