import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenTitle extends StatelessWidget {
  ScreenTitle({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }
}
