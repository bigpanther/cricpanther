import 'package:cricket_scorer/game/enums/extra.dart';
import 'package:cricket_scorer/game/enums/out.dart';
import 'package:cricket_scorer/game/player.dart';

class Delivery {
  int runs = 0;
  Player batter;
  Player bowler;
  var extras = [Extra.none];
  var out = Out.none;
  Player fielder;

  bool validate() {
    return true;
  }
}
