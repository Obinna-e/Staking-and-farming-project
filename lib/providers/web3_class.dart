import "package:flutter/widgets.dart";
import 'package:flutter_web3_provider/ethereum.dart';
import 'package:flutter_web3_provider/ethers.dart';

class Web3Class extends ChangeNotifier {
  static const erc20Abi = [
    "event Transfer(address indexed _from, address indexed _to, uint _value)",
    "event Approval(address indexed _owner, address indexed _spender, uint _value)",
    "function totalSupply() public view returns (uint)",
    "function balanceOf(address _owner) public view returns (uint)",
    "function transfer(address _to, uint _value) public returns (bool success)",
    "function approve(address _spender, uint _value) public returns (bool success)",
    "function transferFrom(address _from, address _to, uint _value) public returns (bool success)",
    "function allowance(address _owner, address _spender) public view returns (uint remaining)",
  ];
  static const String mDaiTokenAddress =
      "0x5C92eAE7FE28316E28355B0E1Be925d4beE26A90";

  String selectedAddress;
  Web3Provider web3;
  Future balanceF;
  Future mdaiBalance;
  Future stakingBalance;

  final String tokenFarmAddress = "0x723b819AF4D4c408C274b969fb117c702670249E";

  var provider =
      JsonRpcProvider('https://data-seed-prebsc-1-s1.binance.org:8545');
}
