import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimeContainer extends StatelessWidget {
  TimeContainer({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: const Color.fromARGB(75, 0, 134, 211),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      )),
    );
  }
}
