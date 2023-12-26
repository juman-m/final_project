import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.color,
    required this.title,
    required this.background,
    required this.text,
  });

  final Color color;
  final Color background;
  final Color text;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Chip(
        avatar: Container(
          width: 14,
          height: 14,
          decoration: ShapeDecoration(
            color: color,
            shape: const OvalBorder(),
          ),
        ),
        padding: const EdgeInsets.only(bottom: 3, left: 5),
        labelStyle: TextStyle(
          color: text,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: background,
        label: Text(title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide.none,
      ),
    );
  }
}
