import 'package:flutter/material.dart';

class ScreenAppBar extends StatelessWidget {
  const ScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 105,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color(0xFF0086D3),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 48),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 126,
                right: 8,
                top: 8,
              ),
            ),
            Icon(
              Icons.location_on,
              size: 32,
              color: Colors.white,
            ),
            Text(
              'الرياض',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
