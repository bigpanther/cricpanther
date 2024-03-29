import 'package:cricpanther/l10n/locales/l10n.dart';
import 'package:cricpanther/match/match.dart';
import 'package:cricpanther/screens/score_page_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

class MatchCreate extends StatefulWidget {
  final String title;

  const MatchCreate({super.key, required this.title});
  @override
  MatchCreateState createState() {
    return MatchCreateState();
  }
}

class MatchCreateState extends State<MatchCreate> {
  final _formKey = GlobalKey<FormState>();
  late String homeTeamName;
  late String awayTeamName;
  late int totalOvers;
  late int maxPlayers;
  bool isSecondInnings = false;
  int target = 0;
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
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(children: <Widget>[
                  TextFormField(
                    maxLength: 30,
                    autocorrect: false,
                    initialValue: Match.defaultHomeTeamName,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: InputDecoration(
                      hintText: '${match.homeTeam.name} name',
                      labelText: '${match.homeTeam.name} Name *',
                      counterText: '',
                    ),
                    validator: (value) {
                      return checkRequired(value);
                    },
                    onSaved: (val) => setState(() => homeTeamName = val!),
                  ),
                  TextFormField(
                    maxLength: 30,
                    autocorrect: false,
                    initialValue: Match.defaultAwayTeamName,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: InputDecoration(
                      hintText: '${match.awayTeam.name} name',
                      labelText: '${match.awayTeam.name} Name *',
                      counterText: '',
                    ),
                    validator: (value) {
                      return checkRequired(value);
                    },
                    onSaved: (val) => setState(() => awayTeamName = val!),
                  ),
                  TextFormField(
                    maxLength: 2,
                    initialValue: '50',
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    autocorrect: false,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: const InputDecoration(
                      hintText: '50',
                      labelText: 'Overs',
                      counterText: '',
                    ),
                    validator: (value) {
                      var val = int.parse(value!);
                      if (val <= 0 || val > 50) {
                        return 'Please enter a value between 1 and 50';
                      }
                      return null;
                    },
                    onSaved: (val) =>
                        setState(() => totalOvers = int.parse(val!)),
                  ),
                  TextFormField(
                    maxLength: 2,
                    initialValue: '11',
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    autocorrect: false,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: const InputDecoration(
                      hintText: '11',
                      labelText: 'Number of players per team',
                      counterText: '',
                    ),
                    validator: (value) {
                      var val = int.parse(value!);
                      if (val <= 1 || val > 11) {
                        return 'Please enter a value between 2 and 11';
                      }
                      return null;
                    },
                    onSaved: (val) =>
                        setState(() => maxPlayers = int.parse(val!)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Record second innings only'),
                      Switch.adaptive(
                        onChanged: (bool value) {
                          setState(() {
                            isSecondInnings = value;
                          });
                        },
                        value: isSecondInnings,
                      ),
                    ],
                  ),
                  TextFormField(
                    maxLength: 3,
                    initialValue: '0',
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    readOnly: !isSecondInnings,
                    autocorrect: false,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: const InputDecoration(
                      hintText: '0',
                      labelText:
                          'Target (set when recording only the second innings)',
                      counterText: '',
                    ),
                    validator: (value) {
                      var val = int.parse(value!);
                      if (isSecondInnings && (val <= 0 || val > 999)) {
                        return 'Please enter a value between 1 and 1000';
                      }
                      return null;
                    },
                    onSaved: (val) => setState(() => target = int.parse(val!)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final state = _formKey.currentState;
                      if (state != null && state.validate()) {
                        state.save();
                        match.homeTeam.name = homeTeamName;
                        match.awayTeam.name = awayTeamName;
                        match.totalOvers = totalOvers;
                        match.maxPlayers = maxPlayers;
                        match.firstInnings = !isSecondInnings;
                        if (isSecondInnings) {
                          match.target = target;
                        }
                        match.start(
                            toss: match.awayTeam, batting: match.awayTeam);
                        Navigator.pushReplacementNamed(
                            context, ScorePageBuilder.routeName);
                      }
                    },
                    child: const Text('Start match'),
                  ),
                ]),
              ),
            ),
            RichText(
              text: TextSpan(
                text: CricpantherLocalizations.of(context).aboutUs,
                style: Theme.of(context).textTheme.bodyLarge,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final packageInfo = await PackageInfo.fromPlatform();
                    final appName = packageInfo.appName;
                    final version = packageInfo.version;
                    if (!mounted) return;
                    final themeData = Theme.of(context);
                    final msgStyle = themeData.textTheme.bodyLarge;
                    final localization = CricpantherLocalizations.of(context);
                    final linkStyle =
                        msgStyle!.copyWith(color: themeData.primaryColor);
                    showAboutDialog(
                      context: context,
                      // applicationIcon: const Image(
                      //   image: AssetImage(
                      //     'assets/images/cricpanther_logo.png',
                      //   ),
                      //   width: 48.0,
                      //   height: 48.0,
                      // ),
                      applicationName: appName,
                      applicationVersion: version,
                      applicationLegalese: localization.applicationLegalese,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  style: msgStyle,
                                  text: localization.reachUsAt,
                                ),
                                TextSpan(
                                  style: linkStyle,
                                  text: ' info@bigpanther.ca',
                                ),
                                const TextSpan(
                                  text: '\n',
                                ),
                                TextSpan(
                                  style: themeData.textTheme.bodySmall,
                                  text: localization.madeWithLove,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? checkRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter team name';
    }
    return null;
  }
}
