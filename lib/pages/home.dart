import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data;

  @override
  Widget build(BuildContext context) {
    // Navigator.popUntil(context, ModalRoute.withName('/home'));

    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    // print("print from home.dart: $data");

    // set background image
    String bgImage = data?["isDayTime"] == true ? "day.png" : "night.png";
    print(bgImage);
    Color? bgColor =
        data?["isDayTime"] == true ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,
          )),
          padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
          alignment: Alignment.center,
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/location");
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(color: Colors.grey[300]),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0, // Remove button elevation
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                data?["location"] ?? "location not available",
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                data?["time"] ?? "time not available",
                style: TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
