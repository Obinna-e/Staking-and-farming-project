import 'package:flutter/material.dart';
import 'package:normi/components/applyPage.dart';
import 'package:normi/components/staking.dart';
import 'package:normi/providers/walletAdd.dart';
import 'package:provider/provider.dart';

import './components/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: WalletAddress())],
      child: MaterialApp(
        home: MyHomePage(),
        routes: {
          MyHomePage.routeName: (ctx) => MyHomePage(),
          StakingPage.routeName: (ctx) => StakingPage(),
          ApplyPage.routeName: (ctx) => ApplyPage(),
        },
      ),
    );
  }
}
