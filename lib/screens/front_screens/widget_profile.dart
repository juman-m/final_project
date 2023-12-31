import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final IconData leftIcon;
  final String leftText;
  final VoidCallback? onPressed; 

  const CustomContainer({
    Key? key,
    required this.leftIcon,
    required this.leftText,
    this.onPressed, // New line added
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: onPressed, 
      child: Container(
        width: 330,
        height: 60,
        decoration: ShapeDecoration(
          color: Color.fromARGB(65, 93, 184, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  leftIcon,
                  color: Color(0xff0086D3),
                ),
                SizedBox(width: 8),
                Text(
                  leftText,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_right_sharp,
                  size: 33,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomContainer extends StatelessWidget {
//   final IconData leftIcon;
//   final String leftText;

//   const CustomContainer({
//     Key? key,
//     required this.leftIcon,
//     required this.leftText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 330,
//       height: 60,
//       decoration: ShapeDecoration(
//         color: Color.fromARGB(65, 93, 184, 230),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(11),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 width: 10,
//               ),
//               Icon(
//                 leftIcon,
//                 color: Color(0xff0086D3),
//               ),
//               SizedBox(width: 8),
//               Text(
//                 leftText,
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontFamily: 'Cairo',
//                   fontWeight: FontWeight.w400,
//                   height: 0,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               SizedBox(width: 8),
//               Icon(
//                 Icons.arrow_right_sharp,
//                 size: 33,
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
