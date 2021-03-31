import 'package:flutter/material.dart';
import 'package:normi/widgets/findworkpage.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/findwork';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _isHovering = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/normi_logo.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'Normi',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[0] = true : _isHovering[0] = false;
                    });
                  },
                  //add column in child to show extra options
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Inspiration',
                        style: TextStyle(
                          color: _isHovering[0]
                              ? Colors.deepPurple
                              : Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[0],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 80,
                ),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[1] = true : _isHovering[1] = false;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Find Work',
                        style: TextStyle(
                          color: _isHovering[1]
                              ? Colors.deepPurple
                              : Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[1],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 80,
                ),
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[2] = true : _isHovering[2] = false;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hire Normie',
                        style: TextStyle(
                          color: _isHovering[2]
                              ? Colors.deepPurple
                              : Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[2],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 80,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/staking');
                  },
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Staking',
                        style: TextStyle(
                          color: _isHovering[3]
                              ? Colors.deepPurple
                              : Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[3],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 50,
                ),
                SizedBox(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text('Connect Wallet'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: FindWork(),
    );
  }
}
