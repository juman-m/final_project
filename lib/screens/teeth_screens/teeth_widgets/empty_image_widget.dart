import 'package:flutter/material.dart';

class EmptyImageWidget extends StatelessWidget {
  const EmptyImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Color(0xffC7C7C8),
          ),
          Text(
            'تحميل الصورة',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFC6C7C7),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ]);
  }
}
