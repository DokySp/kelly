import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MainView.dart';
import 'WelcomeView.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: WelcomeView(),
        routes: {
          "/MainView": (_) => MainView(),
          "/welcomeView": (_) => WelcomeView(),
        },
      );
}
