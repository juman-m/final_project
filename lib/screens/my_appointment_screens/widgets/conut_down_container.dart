import 'package:flutter/material.dart';

class CountDownContainer extends StatelessWidget {
  const CountDownContainer({
    super.key,
    required this.remaining,
    required this.isTime,
  });
  final String remaining;
  final bool isTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: const Color(0xff81C5E8),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(remaining,
              style: TextStyle(
                  fontSize: isTime == true ? 17 : 22,
                  color: Colors.black,
                  fontWeight:
                      isTime == true ? FontWeight.w700 : FontWeight.w600))),
    );
  }
}
