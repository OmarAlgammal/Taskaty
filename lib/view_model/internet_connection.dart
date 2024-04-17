import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';


class InternetConnection{

  bool connected = false;

  Stream<ConnectivityResult> onConnectivityChanged(){
    final connectivityChanged = Connectivity().onConnectivityChanged;
    connectivityChanged.listen((connectivityResult) {
      connected = connectivityResult != ConnectivityResult.none;
    });
    return connectivityChanged;
  }
}