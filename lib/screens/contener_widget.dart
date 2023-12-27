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
        width: 120,
        height: 110,
        decoration: BoxDecoration(
          color: Color.fromRGBO(242, 249, 254, 1),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 70,
              height: 70,
            ),
            // SizedBox(height: 8),
            Text(
              serviceName,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}



// class ServiceSquareContainer extends StatelessWidget {
//   final String imagePath;
//   final String serviceName;

//   const ServiceSquareContainer({
//     Key? key,
//     required this.imagePath,
//     required this.serviceName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 120,
//           height: 100,
//           decoration: BoxDecoration(
//             color: Color.fromRGBO(242, 249, 254, 1),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Image.asset(
//             imagePath,
//             width: 70,
//             height: 70,
//           ),
//         ),
//         Text(
//           serviceName,
//           style: TextStyle(fontSize: 14),
//         ),
//       ],
//     );
//   }
// }
