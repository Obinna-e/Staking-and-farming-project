import 'package:flutter/material.dart';

import 'package:normi/widgets/ctmScaffold.dart';

class ApplyPage extends StatelessWidget {
  static const routeName = '/applyPage';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Row(
        children: [
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(children: [
                    Icon(Icons.arrow_back_ios),
                    Text("All Jobs")
                  ])),
              Text("Job Details"),
              Text("Graphics Designer"),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Share"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Tweet"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Copy"),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
