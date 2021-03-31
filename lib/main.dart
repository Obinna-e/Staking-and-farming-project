import 'package:flutter/material.dart';
import 'package:normi/components/staking.dart';

import './components/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        MyHomePage.routeName: (ctx) => MyHomePage(),
        StakingPage.routeName: (ctx) => StakingPage(),
      },
    );
  }
}
