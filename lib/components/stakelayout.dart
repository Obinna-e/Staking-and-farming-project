// import 'dart:js_util';

import 'dart:js_util';

import 'package:decimal/decimal.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_web3_provider/ethereum.dart';
import 'package:flutter_web3_provider/ethers.dart';
// import 'package:web3dart/credentials.dart';

// import 'package:flutter/services.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:http/http.dart' as http;

import 'utils.dart';

//Abi for mDai
const erc20Abi = [
  "event Transfer(address indexed _from, address indexed _to, uint _value)",
  "event Approval(address indexed _owner, address indexed _spender, uint _value)",
  "function totalSupply() public view returns (uint)",
  "function balanceOf(address _owner) public view returns (uint)",
  "function transfer(address _to, uint _value) public returns (bool success)",
  "function approve(address _spender, uint _value) public returns (bool success)",
  "function transferFrom(address _from, address _to, uint _value) public returns (bool success)",
  "function allowance(address _owner, address _spender) public view returns (uint remaining)",
];

//Abi for Staking contract
const TokenFarmAbi = [
  "function stakeToken(uint _amount) public",
  "function unstakeToken() public",
  "function stakeAmount(address _owner) public view returns(uint)",
  "function issueToken() public",
];

//Abi for Staking contract
const NormiTokenAbi = [
  "event Transfer(address indexed _from, address indexed _to, uint _value)",
  "event Approval(address indexed _owner, address indexed _spender, uint _value)",
  "function totalSupply() public view returns (uint)",
  "function balanceOf(address _owner) public view returns (uint)",
  "function transfer(address _to, uint _value) public returns (bool success)",
  "function approve(address _spender, uint _value) public returns (bool success)",
  "function transferFrom(address _from, address _to, uint _value) public returns (bool success)",
  "function allowance(address _owner, address _spender) public view returns (uint remaining)",
];

const String mDaiTokenAddress = "0x5C92eAE7FE28316E28355B0E1Be925d4beE26A90";

const String TokenFarmAddress = "0x723b819AF4D4c408C274b969fb117c702670249E";

const String NormiTokenAddress = "0xFf884651156E00eE52F587D6D70262DE55aE8A3d";

class StakeLayout extends StatefulWidget {
  @override
  _StakeLayoutState createState() => _StakeLayoutState();
}

class _StakeLayoutState extends State<StakeLayout> {
  String selectedAddress;
  Web3Provider web3;
  Future balanceF;
  Future mdaiBalance;
  Future stakingBalance;
  Future rewardBalance;

  final String tokenFarmAddress = "0x723b819AF4D4c408C274b969fb117c702670249E";

  var provider =
      JsonRpcProvider('https://data-seed-prebsc-1-s1.binance.org:8545');

  String amount = "15";

  var approveContract;

//for read-write provider (ie: metamask)
  @override
  void initState() {
    super.initState();
    if (ethereum != null) {
      web3 = Web3Provider(ethereum);
      balanceF = promiseToFuture(web3.getBalance(ethereum.selectedAddress));
      var contract = Contract(mDaiTokenAddress, erc20Abi, web3);
      mdaiBalance = promiseToFuture(
          callMethod(contract, "balanceOf", [ethereum.selectedAddress]));
      var stakeContract = Contract(tokenFarmAddress, TokenFarmAbi, web3);
      stakingBalance = promiseToFuture(
          callMethod(stakeContract, "stakeAmount", [ethereum.selectedAddress]));
      var rewardContract = Contract(NormiTokenAddress, NormiTokenAbi, web3);
      rewardBalance = promiseToFuture(
          callMethod(rewardContract, "balanceOf", [ethereum.selectedAddress]));
    }
  }

  //Logic for textfield(under-review)
  TextEditingController _textEditingController = TextEditingController();

  String codeDialog;
  String valueText;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Staking Amount'),
            content: TextField(
              inputFormatters: [
                //Regular expressions to only handle decimals
                FilteringTextInputFormatter.allow(
                    RegExp('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$'))
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textEditingController,
              decoration: InputDecoration(hintText: "Type Amount To Stake"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text("CANCEL")),
              TextButton(
                onPressed: () async {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                  var contract = Contract(mDaiTokenAddress, erc20Abi, web3);
                  var contract2 = contract.connect(web3.getSigner());
                  var contract3 =
                      Contract(tokenFarmAddress, TokenFarmAbi, web3);

                  Future<void> res() async {
                    await promiseToFuture(callMethod(contract2, "approve", [
                      TokenFarmAddress,
                      "0x" +
                          BigInt.parse(toBase(Decimal.parse("$codeDialog"), 6)
                                  .toString())
                              .toRadixString(16)
                    ]));
                  }

                  //This is to interact with the staking function

                  // THIS STILL RUNS IF ABOVE CODE FAILS. CHANGE THAT

                  Future<void> res2() async {
                    var contract4 = contract3.connect(web3.getSigner());

                    await promiseToFuture(callMethod(contract4, "stakeToken", [
                      "0x" +
                          BigInt.parse(toBase(Decimal.parse("$codeDialog"), 6)
                                  .toString())
                              .toRadixString(16)
                    ]));
                  }

                  try {
                    Future.wait([res()]).then((value) => {res2()});
                  } catch (e) {
                    print("Exception:" + e.toString());
                  }
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.width * 0.1;
    double h2 = MediaQuery.of(context).size.height * 0.05;

    return Container(
      padding: EdgeInsets.only(
        left: h1,
        right: h1,
        top: h2,
        bottom: h2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 400,
              width: 700,
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        Text(
                          'Staked Tokens',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                        Spacer(),
                        IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Text(
                        'Current Stake',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Accumulated Rewards',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        FutureBuilder(
                          future: stakingBalance,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("error: ${snapshot.error}");
                            }
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            var big = BigInt.parse(snapshot.data.toString());
                            var d = toDecimal(big, 6);
                            return Text("$d mDai");
                          },
                        ),
                        Spacer(),
                        FutureBuilder(
                          future: rewardBalance,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("error: ${snapshot.error}");
                            }
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            var big = BigInt.parse(snapshot.data.toString());
                            var d = toDecimal(big, 6);
                            return Text("$d NRM");
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          "Total Balance",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Reward APY',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        FutureBuilder(
                          future: mdaiBalance,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("error: ${snapshot.error}");
                            }
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            //Convert snapshot value to decimal
                            var big = BigInt.parse(snapshot.data.toString());
                            var d = toDecimal(big, 6);
                            return Text("$d");
                          },
                        ),
                        Spacer(),
                        Text(
                          '200%',
                          style: TextStyle(
                            color: Colors.deepPurple[200],
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'When you add or remove funds the rewards earned will be added to the current staked amount and the rewards balance will be reset.',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text('Stake'),
                            onPressed: () async {
                              _displayTextInputDialog(context);
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 120,
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurple[100],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                'Unstake',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () async {
                                var contract3 = Contract(
                                    tokenFarmAddress, TokenFarmAbi, web3);
                                var contract4 =
                                    contract3.connect(web3.getSigner());
                                try {
                                  var res = await promiseToFuture(callMethod(
                                      contract4, "unstakeToken", []));
                                  print("Transferred: ${res.toString()}");
                                } catch (e) {
                                  print("EXCEPTION:" + e.toString());
                                }
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
