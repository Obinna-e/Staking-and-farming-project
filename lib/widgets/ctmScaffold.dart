import 'package:flutter/material.dart';
import 'package:normi/widgets/appBarItems.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: CustomAppBarItems(),
      ),
      body: body,
    );
  }
}
