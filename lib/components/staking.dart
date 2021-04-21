import 'dart:js_util';

import 'package:flutter/material.dart';
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
      body: StakeLayout(),
    );
  }
}
