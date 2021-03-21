import 'package:cricpanther/match/match.dart';
import 'package:cricpanther/match/enums/out.dart';
import 'package:cricpanther/match/team.dart';
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
            teamScore(
                battingTeam: match.battingTeam, bowlingTeam: match.bowlingTeam),
            teamScore(
                battingTeam: match.bowlingTeam, bowlingTeam: match.battingTeam),
          ],
        ),
      ),
      length: 2,
    );
  }

  SingleChildScrollView teamScore(
      {@required Team battingTeam, @required Team bowlingTeam}) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text("Batting"),
          DataTable(
            columnSpacing: 5.0,
            columns: [
              DataColumn(
                label: Text('Player'),
              ),
              DataColumn(
                label: Text('Status'),
              ),
              DataColumn(
                label: Text('Runs'),
              ),
              DataColumn(
                label: Text('4s'),
                numeric: true,
              ),
              DataColumn(
                label: Text('6s'),
                numeric: true,
              ),
            ],
            rows: battingTeam.players
                .where((t) => (t.battingStats.balls > 0))
                .map<DataRow>(
                  (p) => DataRow(
                    cells: [
                      DataCell(
                        Text(p.name),
                        //showEditIcon: true,
                      ),
                      DataCell(
                        Text('${p.out.text}'),
                      ),
                      DataCell(
                        Text('${p.battingStats.runs}(${p.battingStats.balls})'),
                      ),
                      DataCell(
                        Text('${p.battingStats.fours}'),
                      ),
                      DataCell(
                        Text('${p.battingStats.sixes}'),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          Text("Bowling"),
          DataTable(
            columnSpacing: 5.0,
            columns: [
              DataColumn(
                label: Text('Player'),
              ),
              DataColumn(
                label: Text('O'),
              ),
              DataColumn(
                label: Text('M'),
                numeric: true,
              ),
              DataColumn(
                label: Text('R'),
                numeric: true,
              ),
              DataColumn(
                label: Text('W'),
                numeric: true,
              ),
              DataColumn(
                label: Text('Wd'),
                numeric: true,
              ),
              DataColumn(
                label: Text('NB'),
                numeric: true,
              ),
            ],
            rows: bowlingTeam.players
                .where((t) => (t.bowlingStats.balls > 0))
                .map<DataRow>(
                  (p) => DataRow(
                    cells: [
                      DataCell(
                        Text(p.name),
                        //showEditIcon: true,
                      ),
                      DataCell(
                        Text('${p.bowlingStats.oversBowled}'),
                      ),
                      DataCell(
                        Text('${p.bowlingStats.maidens}'),
                      ),
                      DataCell(
                        Text('${p.bowlingStats.runs}'),
                      ),
                      DataCell(
                        Text('${p.bowlingStats.wickets}'),
                      ),
                      DataCell(
                        Text('${p.bowlingStats.wides}'),
                      ),
                      DataCell(
                        Text('${p.bowlingStats.noBalls}'),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
