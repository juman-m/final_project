import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';

class DisplayImageWidget extends StatelessWidget {
  const DisplayImageWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 162,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F9B9A9A),
            blurRadius: 8,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          height10(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          height16(),
          Container(
            width: 75,
            height: 81,
            decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
            child: const Center(
              child: Text(
                'لا يوجد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD6D6D6),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
