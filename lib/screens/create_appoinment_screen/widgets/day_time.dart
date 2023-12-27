import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DayTime extends StatelessWidget {
  DayTime({super.key, required this.text, required this.isSelected});
  String text;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: isSelected ? const Color(0xff008CDC) : const Color(0xffD3D3D3),
        // fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
