import 'package:flutter/material.dart';

class ServiceSquareContainer extends StatelessWidget {
  final String imagePath;
  final String serviceName;
  final VoidCallback? onPressed;

  const ServiceSquareContainer({
    Key? key,
    required this.imagePath,
    required this.serviceName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 113.40,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(242, 249, 254, 1),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F898989),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
           
            Text(
              textAlign: TextAlign.center,
              serviceName,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  height: 0),
            ),
          ],
        ),
      ),
    );
  }
}



