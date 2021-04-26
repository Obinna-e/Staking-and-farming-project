import 'package:flutter/material.dart';
import 'package:normi/widgets/Alertbox.dart';

class FindWork extends StatefulWidget {
  @override
  _FindWorkState createState() => _FindWorkState();
}

class _FindWorkState extends State<FindWork> {
  var _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 50,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                          child: Text(
                            'Full-Time Job Board',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            shape: BoxShape.rectangle,
                            color: Colors.grey[200],
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Freelance Projects',
                              style: TextStyle(
                                  color: _isHovering
                                      ? Colors.black
                                      : Colors.blueGrey),
                            ),
                          ),
                          onHover: (value) {
                            setState(() {
                              value ? _isHovering = true : _isHovering = false;
                            });
                          },
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Web3 Jobs',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Welcome to web3! Decentralise your income with Normi.\nJoin the community of Normies.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                          child: SizedBox(
                            height: 40,
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurple[300],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                'Post a Job',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey[200],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                'Search for freelancers',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Center(
                child: Container(
                  width: 600,
                  height: 550,
                  child: Image.asset(
                    'assets/images/find_work.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent new opportunities",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "5 new opportunities",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      myListView(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
