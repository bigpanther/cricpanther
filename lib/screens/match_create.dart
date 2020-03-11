import 'package:cricket_scorer/match/match.dart';
import 'package:cricket_scorer/screens/score_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MatchCreate extends StatefulWidget {
  final String title;

  MatchCreate({Key key, this.title}) : super(key: key);
  @override
  MatchCreateState createState() {
    return MatchCreateState();
  }
}

class MatchCreateState extends State<MatchCreate> {
  final _formKey = GlobalKey<FormState>();
  String homeTeamName;
  String awayTeamName;
  int totalOvers;
  @override
  Widget build(BuildContext context) {
    var match = Provider.of<Match>(context, listen: false);
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
                      hintText: '${match.homeTeam.name} name',
                      labelText: '${match.homeTeam.name} Name *',
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
                      hintText: '${match.awayTeam.name} name',
                      labelText: '${match.awayTeam.name} Name *',
                      counterText: '',
                    ),
                    validator: (value) {
                      return checkRequired(value);
                    },
                    onSaved: (val) => setState(() => awayTeamName = val),
                  ),
                  TextFormField(
                    maxLength: 2,
                    initialValue: '50',
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    autocorrect: false,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                      hintText: '50',
                      labelText: 'Overs',
                      counterText: '',
                    ),
                    validator: (value) {
                      var val = int.parse(value);
                      if (val <= 0 || val > 50) {
                        return "Please enter a value between 1 and 50";
                      }
                      return null;
                    },
                    onSaved: (val) =>
                        setState(() => totalOvers = int.parse(val)),
                  ),
                  DropdownButton<int>(
                    value: totalOvers,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (int newValue) {
                      setState(() {
                        totalOvers = newValue;
                      });
                    },
                    items: <int>[20, 45, 50]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        match.homeTeam.name = homeTeamName;
                        match.awayTeam.name = awayTeamName;
                        match.totalOvers = totalOvers;
                        match.start(match.awayTeam, match.awayTeam);
                        Navigator.pushReplacementNamed(
                            context, ScorePageBuilder.routeName);
                      }
                    },
                    child: Text('Start match'),
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
