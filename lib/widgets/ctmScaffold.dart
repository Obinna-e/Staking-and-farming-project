import 'package:flutter/material.dart';
import 'package:normi/widgets/appBarItems.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    double h1 = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: CustomAppBarItems(),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: h1,
              right: h1,
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
