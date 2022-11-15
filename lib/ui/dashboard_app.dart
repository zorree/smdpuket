import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'dashboard.dart';

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
            const Locale('en', 'US'), // English
            const Locale('th', 'TH'), // Thai
      ],
      home: Dashboard(),
      //home : CrudForm(name: "aaaaaa"),
    );
  }
}

