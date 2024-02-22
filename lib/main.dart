// ignore_for_file: unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:cricpanther/l10n/locales/l10n.dart';
import 'package:cricpanther/match/match.dart';
import 'package:cricpanther/screens/match_create.dart';
import 'package:cricpanther/screens/score_page_builder.dart';
import 'package:cricpanther/screens/scorecard.dart';
import 'package:cricpanther/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Match>(
      create: (_) => new Match(),
      child: MaterialApp(
        title: 'Cricket Scorer',
        initialRoute: '/',
        routes: {
          ScorePageBuilder.routeName: (context) =>
              ScorePageBuilder(title: 'Scoresheet'),
          Scorecard.routeName: (context) => Scorecard(title: 'Scorecard'),
        },
        debugShowCheckedModeBanner: false,
        darkTheme: Cricpanther.darkTheme,
        theme: Cricpanther.lightTheme,
        themeMode: ThemeMode.system,
        home: MatchCreate(title: 'Start Match'),
        localizationsDelegates: [
          const AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const AppLocalizationDelegate().supportedLocales,
      ),
    );
  }
}
