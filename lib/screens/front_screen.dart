import 'package:flutter/material.dart';
import 'package:final_project/screens/teeth_screens/teeth_screen.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(height: 20),
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 50, left: 16),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeethScreen(),
              ),
            );
          },
          child: Image.asset(
            'assets/flot.png',
            height: 80,
            width: 80,
          ),
          backgroundColor: Color(0xff018CDD),
          elevation: 2,
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
