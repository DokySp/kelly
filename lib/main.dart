import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MainView.dart';
import 'WelcomeView.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // TODO: iOS 상단바 색 조절 필요
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MaterialApp(
          home: WelcomeView(),
          routes: {
            "/MainView": (_) => MainView(),
            "/welcomeView": (_) => WelcomeView(),
          },
        ),
      );
}
