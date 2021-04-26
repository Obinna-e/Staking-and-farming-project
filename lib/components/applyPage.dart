import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:normi/widgets/ctmScaffold.dart';

class ApplyPage extends StatelessWidget {
  static const routeName = '/applyPage';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Job Details',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Graphics Designer',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            //Refactor code to have a custom button to avoid duplication
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.facebook,
                                    size: 15,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Share",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey[200]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.twitter,
                                      size: 15,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Tweet",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[200]),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.link,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Copy",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey[200]),
                              ),
                            ),
                          ],
                        ),
                        Text(
                            "Our team is building a platform to turn the freelance industry into a protocol layer on the blockchain "),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurple[300])),
                            onPressed: () {},
                            child: Text("Apply for this position"),
                          ),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    SizedBox(
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      width: 300,
                      height: MediaQuery.of(context).size.height,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 130,
          left: 50,
          child: Container(
            height: 40,
            width: 100,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[200])),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  Text(
                    "All Jobs",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
