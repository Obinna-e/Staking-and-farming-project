import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_web3_provider/ethereum.dart';

import 'package:normi/widgets/ctmScaffold.dart';
import './stakelayout.dart';

class StakingPage extends StatefulWidget {
  static const routeName = '/staking';

  @override
  _StakingPageState createState() => _StakingPageState();
}

class _StakingPageState extends State<StakingPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ethereum == null
          ? Center(
              child: Container(
                child: Text("Please Connect to BSC"),
              ),
            )
          : StakeLayout(),
    );
  }
}
