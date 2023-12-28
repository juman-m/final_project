import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenButton extends StatelessWidget {
  ScreenButton({super.key, required this.onTap, required this.text});
  String text;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 270,
        decoration: BoxDecoration(
          color: const Color(0xff008CDC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
