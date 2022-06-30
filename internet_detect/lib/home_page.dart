import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String status = "Checking status";
  Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  @override
  void initState() {
    // checkConnectivity();
    checkinit();
    super.initState();
  }

  void checkConnectivity() async {
    var connectionResult = await _connectivity.checkConnectivity();
    if (connectionResult == ConnectivityResult.mobile) {
      setState(() {
        status = status;
      });
      print("Connected");
    } else if (connectionResult == ConnectivityResult.wifi) {
      status = "Connected";
      setState(() {
        status = status;
      });
      print("Connected");
    } else {
      status = "Not Connected";
      print("Not Connected");
      setState(() {
        status = status;
      });
    }
  }

  void checkinit() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        status = "Connected";
        print("Connected");
        setState(() {
          status = status;
        });
      } else if (event == ConnectivityResult.wifi) {
        status = "Connected";
        print("Connected");
        setState(() {
          status = status;
        });
      } else {
        status = "Not Connected";
        print("Not Connected");
        setState(() {
          status = status;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: status == "Connected"
            ? const Text("Your are online now")
            : const Text("Your are offline now"),
      )),
    );
  }
}
