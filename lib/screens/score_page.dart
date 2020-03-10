import 'package:cricket_scorer/game/game.dart';
import 'package:cricket_scorer/scoresheet/scoresheet.dart';
import 'package:cricket_scorer/widgets/scoreboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatelessWidget {
  static final String routeName = '/scorepage';
  final String title;
  ScorePage({Key key, this.title}) : super(key: key);

  final runs = List<int>.generate(300, (i) => i % 6);

  List<Widget> _scoringButtons(Scoresheet scoresheet) {
    List<Widget> runButtons = List(6);
    for (var i = 0; i < 6; i++) {
      runButtons[i] = FloatingActionButton(
        heroTag: 'h$i',
        shape: CircleBorder(side: BorderSide.none),
        onPressed: () {
          scoresheet.addRuns(i + 1);
        },
        child: Text((i + 1).toString()),
      );
    }
    return runButtons;
  }

  @override
  Widget build(BuildContext context) {
    var game = Provider.of<Game>(context, listen: false);
    var scoresheet = Provider.of<Scoresheet>(context, listen: true);
    print('rebuild scorepage');
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from thre ScorePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(this.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(children: [
          scoreboard(scoresheet, context),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    '${game.battingTeam.name} - Batting',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${scoresheet.currentBatter1.name}*',
                      ),
                      Text(
                        '${scoresheet.currentBatter1.runsScored}(${scoresheet.currentBatter1.ballsFaced})',
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        scoresheet.currentBatter2.name,
                      ),
                      Text(
                        '${scoresheet.currentBatter2.runsScored}(${scoresheet.currentBatter2.ballsFaced})',
                      ),
                    ]),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    '${game.bowlingTeam.name} - Bowling',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${scoresheet.currentBowler1.name}*',
                      ),
                      Text(
                        '${scoresheet.currentBowler1.oversBowled}-${scoresheet.currentBowler1.maidensBowled}-${scoresheet.currentBowler1.runsConceded}-${scoresheet.currentBowler1.wicketsTaken}',
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        scoresheet.currentBowler2.name,
                      ),
                      Text(
                        '${scoresheet.currentBowler2.oversBowled}-${scoresheet.currentBowler2.maidensBowled}-${scoresheet.currentBowler2.runsConceded}-${scoresheet.currentBowler2.wicketsTaken}',
                      ),
                    ]),
                Container(
                  height: 50,
                  child: ListView.separated(
                    shrinkWrap: false,
                    padding: EdgeInsets.only(right: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: scoresheet.currentBalls,
                    separatorBuilder: (context, index) =>
                        buildDivider(index + 1),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 3, bottom: 3),
                        width: 55,
                        child: Center(
                          child: Text(
                            runs[index].toString(),
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      );
                    },
                  ),
                  //shrinkWrap: true,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _scoringButtons(scoresheet),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FloatingActionButton(
              heroTag: 'wkt',
              shape: CircleBorder(side: BorderSide.none),
              onPressed: scoresheet.addWicket,
              child: Text('W+'),
            ),
            RaisedButton(
              child: Text('Select player'),
              onPressed: () {
                showPlayerPicker(context, game);
              },
            ),
          ]),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "main",
        child: Icon(Icons.add),
        onPressed: scoresheet.addBall,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildDivider(int index) {
    if (index % 6 == 0) {
      return new Container(
        height: 30.0,
        width: 1.0,
        color: Colors.black,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      );
    }
    return Container(
      height: 0,
      width: 0,
    );
  }

  showPlayerPicker(BuildContext context, Game game) {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: game.battingTeam.players.map((f) => f.name).toList()),
        changeToFirst: true,
        hideHeader: true,
        title: Text("Select player"),
        selectedTextStyle: TextStyle(color: Theme.of(context).primaryColor),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }).showDialog(context); //_scaffoldKey.currentState);
  }
}
