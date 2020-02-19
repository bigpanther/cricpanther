import 'dart:async';

import 'package:flutter/material.dart';
import 'game.dart';
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

class Scoresheet extends StatefulWidget {
  static final String routeName = '/scoresheet';
  final Game game;
  Scoresheet({Key key, this.title, this.game}) : super(key: key);
  final String title;

  @override
  _ScoresheetState createState() => _ScoresheetState(game);
}

class _ScoresheetState extends State<Scoresheet> {
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  ScrollController _controller;
  int _noOfBalls = 0;
  Game _game;
  final runs = List<int>.generate(300, (i) => i % 6);
  _ScoresheetState(Game game) {
    _game = game;
    _game.start(_game.awayTeam, _game.homeTeam);
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _noOfBalls without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _noOfBalls++;
    });
  }

  void _incrementWickets() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _noOfBalls without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _game.wickets++;
    });
  }

  void _incrementScore(int runs) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _noOfBalls without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _game.runs = _game.runs + runs;
    });
  }

  String overs(int noOfBalls) {
    if (noOfBalls < 1) {
      return "0.0";
    }
    int over = noOfBalls ~/ 6;
    int ball = noOfBalls % 6;
    return '$over.$ball';
  }

  List<Widget> _scoringButtons() {
    List<Widget> runButtons = List(6);
    for (var i = 0; i < 6; i++) {
      runButtons[i] = FloatingActionButton(
        heroTag: 'h$i',
        shape: CircleBorder(side: BorderSide.none),
        onPressed: () {
          _incrementScore(i + 1);
        },
        child: Text((i + 1).toString()),
      );
    }
    return runButtons;
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(milliseconds: 1000),
        () => _controller.animateTo(_controller.position.maxScrollExtent,
            duration: Duration(seconds: 1), curve: Curves.easeOutCirc));
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from thre Scoresheet object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(children: [
                Text.rich(TextSpan(
                  children: <InlineSpan>[
                    TextSpan(text: _game.runs.toString()),
                    TextSpan(text: '/'),
                    TextSpan(text: _game.wickets.toString()),
                  ],
                  style: Theme.of(context).textTheme.display4,
                )),
                Text.rich(TextSpan(
                  children: <InlineSpan>[
                    TextSpan(text: '('),
                    TextSpan(text: overs(_noOfBalls)),
                    TextSpan(text: ')'),
                  ],
                  style: Theme.of(context).textTheme.display2,
                )),
              ]),
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _game.battingTeam.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Harsimran',
                          ),
                          Text(
                            'Ankit',
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('*'),
                          Text(''),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '8(10)',
                          ),
                          Text(
                            '10(2)',
                          )
                        ],
                      ),
                    ]),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _game.bowlingTeam.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Rival Bowler',
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '10.1-3-48-2',
                          ),
                        ],
                      ),
                    ]),
                Container(
                  height: 50,
                  child: ListView.separated(
                    shrinkWrap: false,
                    padding: EdgeInsets.only(right: 20),
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemCount: _noOfBalls,
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
            children: _scoringButtons(),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "main",
        child: Icon(Icons.add),
        onPressed: _incrementCounter,
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
}
