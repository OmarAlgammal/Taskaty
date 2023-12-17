import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';


/// TODO: Transfer this class to view_model directory
class InternetConnection{

  bool connected = false;

  Stream<ConnectivityResult> checkInternetConnection(){
    final connectivityChanged = Connectivity().onConnectivityChanged;
    connectivityChanged.listen((connectivityResult) {
      connected = connectivityResult != ConnectivityResult.none;
    });
    return connectivityChanged;
  }
}