import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:ninja_worldtime/services/world_time.dart';

import '../services/data.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldTime() async {
    // final responseFromFile = await rootBundle.loadString("assets/data.dart");
    // print("data from file : $responseFromFile");

    // final Map fileData = json.decode(responseFromFile) ;
    // print("map data: $fileData");

    WorldTime instance = WorldTime(
      url: Data.url,
      location: Data.location,
      flag: Data.flag,
    );

    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTIme,
    });
  }

  @override
  void initState() {
    super.initState();
    // print("init state ran");
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    // setupWorldTime();
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        alignment: Alignment.center,
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
