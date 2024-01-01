import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;

  const TextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
      ),
    );
  }
}
