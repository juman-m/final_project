import 'package:flutter/material.dart';

class CountDownContainer extends StatelessWidget {
  CountDownContainer({
    super.key,
    required this.remaining,
  });
  final String remaining;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: const Color(0xff81C5E8),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
              // '\t11\nيوم',
              // '1:30:18',
              // '\t\t5\nأيام',
              // 'يومان',
              // '\t10\nأيام',
              remaining,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600))),
    );
  }
}
