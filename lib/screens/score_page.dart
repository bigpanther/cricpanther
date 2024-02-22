import 'dart:async';

import 'package:cricpanther/match/delivery.dart';
import 'package:cricpanther/match/enums/extra.dart';
import 'package:cricpanther/match/enums/out.dart';
import 'package:cricpanther/match/match.dart';
import 'package:cricpanther/scoresheet/scoresheet.dart';
import 'package:cricpanther/screens/scorecard.dart';
import 'package:cricpanther/widgets/batter_summary.dart';
import 'package:cricpanther/widgets/bowler_summary.dart';
import 'package:cricpanther/widgets/player_picker.dart';
import 'package:cricpanther/widgets/scoreboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatelessWidget {
  static const String routeName = '/scorepage';
  final String title;
  ScorePage({super.key, required this.title});

  final runs = List<int>.generate(300, (i) => i % 6);

  @override
  Widget build(BuildContext context) {
    var match = Provider.of<Match>(context, listen: false);
    var scoresheet = Provider.of<Scoresheet>(context, listen: true);
    print('rebuild scorepage');
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from thre ScorePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(children: [
            scoreboard(scoresheet, context),
            InkWell(
              onTap: () => Navigator.pushNamed(context, Scorecard.routeName),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        '${match.battingTeam!.name} - Batting',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        onPressed: scoresheet.changeStrike,
                        tooltip: 'Change Strike',
                        icon: const Icon(Icons.compare_arrows),
                      ),
                    ]),
                    batterSummary(scoresheet.currentBatter1, true),
                    batterSummary(scoresheet.currentBatter2, false),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, Scorecard.routeName),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        '${match.bowlingTeam.name} - Bowling',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        onPressed: () async {
                          var newBowler = await showPlayerPicker(
                            context,
                            match.bowlingTeam.players,
                            'Select Bowler',
                          );
                          if (newBowler != null) {
                            scoresheet.changeBowler(newBowler);
                          }
                        },
                        tooltip: 'Change Bowler',
                        icon: const Icon(Icons.compare_arrows),
                      ),
                    ]),
                    bowlerSummary(scoresheet.currentBowler1, true),
                    bowlerSummary(scoresheet.currentBowler2, false),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                shrinkWrap: false,
                padding: const EdgeInsets.only(right: 20),
                scrollDirection: Axis.horizontal,
                itemCount: scoresheet.lastSevenDeliveries.length,
                separatorBuilder: (context, index) =>
                    buildDivider(scoresheet, index + 1),
                itemBuilder: (context, index) {
                  if (scoresheet.lastSevenDeliveries[index] != '|') {
                    return Container(
                      margin: const EdgeInsets.only(top: 3, bottom: 3),
                      width: 55,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          scoresheet.lastSevenDeliveries[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    );
                  }
                  return const SizedBox(
                    height: 0,
                    width: 0,
                  );
                },
              ),
            ),
            // Row(
            //   children: <Widget>[
            //     FloatingActionButton(
            //       heroTag: 'pl',
            //       shape: CircleBorder(side: BorderSide.none),
            //       onPressed: () {
            //         showPlayerPicker(context, match);
            //       },
            //       child: Text('Pick'),
            //     ),
            //   ],
            // ),
            scoringRow(scoresheet, context, match),
          ]),
        ),
      ),
    );
  }

  Widget scoringRow(Scoresheet scoresheet, BuildContext context, Match match) {
    return ChangeNotifierProvider<Delivery>(
      child: Consumer<Delivery>(
        builder: (context, delivery, child) {
          print('${delivery.runs}');
          print('${delivery.extras}');
          return Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 4.0, 24.0, 4.0),
            child: Column(
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.only(top: 3, bottom: 3),
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        delivery.shortSummary(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  )
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        heroTag: 'penalty',
                        shape: const CircleBorder(side: BorderSide.none),
                        onPressed: () => delivery.addExtra(Extra.penalty),
                        child: const Text('Pen.'),
                      ),
                      FloatingActionButton(
                        heroTag: 'byes',
                        shape: const CircleBorder(side: BorderSide.none),
                        onPressed: () => delivery.addExtra(Extra.bye),
                        child: const Text('Bye'),
                      ),
                      FloatingActionButton(
                        heroTag: 'lbs',
                        shape: const CircleBorder(side: BorderSide.none),
                        onPressed: () => delivery.addExtra(Extra.legBye),
                        child: const Text('LB'),
                      ),
                      FloatingActionButton(
                        heroTag: 'bonus',
                        shape: const CircleBorder(side: BorderSide.none),
                        onPressed: () => delivery.addExtra(Extra.bonus),
                        child: const Text('Bonus'),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          heroTag: 'wkt',
                          shape: const CircleBorder(side: BorderSide.none),
                          onPressed: () => showOutPicker(
                              context, match, scoresheet, delivery),
                          child: const Text('Wkt'),
                        ),
                        FloatingActionButton(
                          heroTag: 'wides',
                          shape: const CircleBorder(side: BorderSide.none),
                          onPressed: () => delivery.addExtra(Extra.wide),
                          child: const Text('Wide'),
                        ),
                        FloatingActionButton(
                          heroTag: 'runs',
                          shape: const CircleBorder(side: BorderSide.none),
                          onPressed: () => delivery.addRuns(1),
                          child: const Text('Runs'),
                        ),
                        FloatingActionButton(
                          heroTag: 'noBalls',
                          shape: const CircleBorder(side: BorderSide.none),
                          onPressed: () => delivery.addExtra(Extra.noBall),
                          child: const Text('NB'),
                        ),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('Add'),
                      onPressed: () => scoresheet.recordDelivery(delivery),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      create: (BuildContext context) => Delivery(),
    );
  }

  Widget buildDivider(Scoresheet scoresheet, int index) {
    if (scoresheet.lastSevenDeliveries[index] == '|') {
      return Container(
        height: 30.0,
        width: 1.0,
        color: Colors.black,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      );
    }
    // if (index % 6 == 0) {}
    return const SizedBox(
      height: 0,
      width: 0,
    );
  }

  showOutPicker(BuildContext context, Match match, Scoresheet scoresheet,
      Delivery delivery) async {
    delivery.out = await () {
      var c = Completer<Out>();
      Picker(
          adapter: PickerDataAdapter<Out>(pickerData: OutExtension.all()),
          changeToFirst: true,
          hideHeader: true,
          title: const Text('Select Out type'),
          selectedTextStyle: TextStyle(color: Theme.of(context).primaryColor),
          onCancel: c.complete,
          onConfirm: (Picker picker, List value) {
            Out out = picker.adapter.getSelectedValues()[0];
            c.complete(out);
          }).showDialog(context);
      return c.future;
    }();
    if (delivery.out.requiresBatter() && context.mounted) {
      delivery.batter = await showPlayerPicker(
        context,
        [scoresheet.currentBatter1, scoresheet.currentBatter2],
        'Select batter',
      );
      if (delivery.batter == null) {
        delivery.out = Out.none;
      }
    }
    if (delivery.out.requiresFielder() && context.mounted) {
      delivery.fielder = await showPlayerPicker(
        context,
        match.bowlingTeam.players,
        'Select fielder',
      );
      if (delivery.fielder == null) {
        delivery.out = Out.none;
        delivery.batter = null;
      }
    }
    print(delivery);
    if (delivery.out != Out.none) {
      delivery.finshAddOut();
    }
  }
}
