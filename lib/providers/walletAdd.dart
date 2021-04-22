import 'dart:js_util';

import 'package:flutter/foundation.dart';

import 'package:flutter_web3_provider/ethereum.dart';

class WalletAddress with ChangeNotifier {
  String selectedAddress;
  bool isConnected = false;

  Future<void> fetchAndSetAddress() async {
    var accounts = await promiseToFuture(
        ethereum.request(RequestParams(method: 'eth_requestAccounts')));
    print(accounts);
    String se = ethereum.selectedAddress.substring(0, 7) + "...";
    selectedAddress = se;
    isConnected = true;
    notifyListeners();
  }
}
