import 'package:final_project/screens/create_appoinment_screen/create_appoinment_screen.dart';
import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff0086D3),
          child: const Icon(
            Icons.date_range_rounded,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateAppointmentScreen()));
          },
        ),
      ),
    );
  }
}
