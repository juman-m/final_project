import 'package:flutter/material.dart';

class FloatinCustomm extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onPressed;

  const FloatinCustomm({
    Key? key,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 69,
        width: 69,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff0086D3),
          child: Image.asset(
            imageUrl,
            height: 32,
            width: 32,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}


    // return ClipOval(
    //   child: Container(
    //     height: 70,
    //     width: 70,
    //     decoration: const BoxDecoration(shape: BoxShape.circle),
    //     child: FloatingActionButton(
    //       backgroundColor: const Color(0xff0086D3),
    //       child: const Icon(
    //         Icons.date_range_rounded,
    //         color: Colors.white,
    //         size: 32,
    //       ),
    //       onPressed: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => CreateAppointmentScreen()));
    //       },
    //     ),
    //   ),
    // );
