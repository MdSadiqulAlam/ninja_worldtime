import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/data.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: "Asia/Dhaka", location: "Dhaka", flag: "bangladesh.png"),
  ];

  Future<void> updateDataFile(index) async {
    // Get the selected location
    WorldTime selectedLocation = locations[index];

    // Define the data object to be written to the JSON file
    // Map<String, dynamic> newData = {
    //   'url': selectedLocation.url,
    //   'location': selectedLocation.location,
    //   'flag': selectedLocation.flag,
    // };

    Data.url = selectedLocation.url;
    Data.location = selectedLocation.location;
    Data.flag = selectedLocation.flag;

    // Convert the data object to JSON format
    // String jsonString = json.encode(newData);
    // String filePath = await rootBundle.loadString("assets/data.dart");
    // try {
    //   // Open the file in write mode
    //   File file = File(filePath);
    //
    //   // Write the JSON string to the file
    //   await file.writeAsString(jsonString);

    // Navigate back to the home screen after successful write
    // Navigator.popUntil(context, (route) => false);
    // Navigator.popAndPushNamed(context, "/");
    Navigator.pushReplacementNamed(context, "/");
    // } catch (e) {
    //   print('Failed to update data: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    print("build state ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Choose Location",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateDataFile(index);
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/${locations[index].flag}"),
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        }),
      ),
    );
  }
}
