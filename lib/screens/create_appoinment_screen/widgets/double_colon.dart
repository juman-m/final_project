import 'package:flutter/material.dart';

class DoubleColon extends StatelessWidget {
  const DoubleColon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      ' : ',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
    );
  }
}
