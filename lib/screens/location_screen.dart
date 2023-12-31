import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            buildLocationItem('assets/5e4baeefe3879 1.png'),
            SizedBox(height: 16),
            buildLocationItem('assets/5e4baeefe3879 1.png'),
          ],
        ),
      ),
    );
  }

  Widget buildLocationItem(String imagePath) {
    return Container(
      width: 240,
      height: 100,
      decoration: ShapeDecoration(
        color: Color(0x1481C5E8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '3.2 كم',
                style: TextStyle(color: Colors.black),
              ),
              Icon(Icons.location_on, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
