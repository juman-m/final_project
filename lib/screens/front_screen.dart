import 'package:final_project/screens/teeth_screens/teeth_screen.dart';
import 'package:flutter/material.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox(height: 20),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 50, left: 16),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeethScreen(),
              ),
            );
          },
          backgroundColor: const Color(0xff018CDD),
          elevation: 2,
          shape: const CircleBorder(),
          child: Image.asset(
            'assets/flot.png',
            height: 80,
            width: 80,
          ),
        ),
      ),
    );
  }
}
