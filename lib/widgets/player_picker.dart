import 'dart:async';

import 'package:cricpanther/match/player.dart';
import 'package:cricpanther/match/player_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';

// class PlayerPickerUI extends PlayerPicker {
//   PlayerPickerUI(List<Player> players) : super(players);
//   @override
//   Player next() {
//     return showPlayerPicker(context, players, "Select player").;
//   }
// }

Future<Player> showPlayerPicker(
  BuildContext context,
  List<Player> players,
  String title,
) async {
  return await () {
    var c = new Completer<Player>();
    Picker(
        adapter: PickerDataAdapter<Player>(pickerdata: players),
        changeToFirst: true,
        hideHeader: true,
        title: Text(title),
        selectedTextStyle: TextStyle(color: Theme.of(context).primaryColor),
        onConfirm: (Picker picker, List value) {
          c.complete(picker.adapter.getSelectedValues()[0]);
        }).showDialog(context);
    return c.future;
  }();
}
