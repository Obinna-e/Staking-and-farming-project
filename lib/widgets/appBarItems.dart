import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:normi/providers/walletAdd.dart';

class CustomAppBarItems extends StatefulWidget {
  @override
  _CustomAppBarItemsState createState() => _CustomAppBarItemsState();
}

class _CustomAppBarItemsState extends State<CustomAppBarItems> {
  final List _isHovering = [false, false, false, false, false];
  String _selectedaddress;

  //*doesn't work yet* method to make wallet address show after refresh
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _selectedaddress =
          Provider.of<WalletAddress>(context, listen: false).selectedAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    get(_selectedaddress);
    final String _selectedAddress =
        Provider.of<WalletAddress>(context).selectedAddress;
    var screenSize = MediaQuery.of(context).size;
    return Container(
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
                      color:
                          _isHovering[0] ? Colors.deepPurple : Colors.blueGrey,
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
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/findwork');
              },
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
                      color:
                          _isHovering[1] ? Colors.deepPurple : Colors.blueGrey,
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
                      color:
                          _isHovering[2] ? Colors.deepPurple : Colors.blueGrey,
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
                      color:
                          _isHovering[3] ? Colors.deepPurple : Colors.blueGrey,
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
                  child: Text(_selectedAddress == null
                      ? 'Connect Wallet'
                      : "$_selectedAddress"),
                  onPressed: () async {
                    await Provider.of<WalletAddress>(context, listen: false)
                        .fetchAndSetAddress();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
