import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for UI
  late String time; // the time that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDayTIme;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // print("reached world_time.dart");
    try {
      // print("sadiq kisu paros na kn");
      Response response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map timeData = jsonDecode(response.body);
      // print(timeData);

      // get property from data
      String datetime = timeData["datetime"];
      String offset = timeData["utc_offset"].substring(1, 3);
      // print(datetime);
      // print(offset);

      // create DateTime time
      DateTime timeNow = DateTime.parse(datetime);
      // print(timeNow);
      timeNow = timeNow.add(Duration(hours: int.parse(offset)));
      // print(timeNow);

      //set the time property
      isDayTIme= (timeNow.hour> 6 && timeNow.hour<20) ? true:false;

      time = DateFormat.jm().format(timeNow);
    } catch (e) {
      print("caught error SADIQ: $e");
      // time = "could not get time data";
    }
  }
}
