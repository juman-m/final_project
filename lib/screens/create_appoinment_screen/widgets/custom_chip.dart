import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
    this.isSelected = false,
  });
  final String text;
  final Color color;
  final Function() onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 20,
      onTap: onTap,
      child: Container(
        height: 38,
        width: 104,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xff7E818C) : const Color(0xffF7F3F3),
            borderRadius: BorderRadius.circular(16.75)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
