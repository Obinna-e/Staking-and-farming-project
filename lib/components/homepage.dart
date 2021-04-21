import 'package:flutter/material.dart';
import 'package:normi/widgets/ctmScaffold.dart';
import 'package:normi/widgets/findworkpage.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/findwork';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: FindWork(),
    );
  }
}
