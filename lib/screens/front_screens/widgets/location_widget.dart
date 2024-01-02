import 'package:flutter/material.dart';

class LocationItemWidget extends StatelessWidget {
  final String imagePath;

  const LocationItemWidget({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
