import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PublishButton extends StatelessWidget {
  PublishButton({super.key, required this.isActive, required this.onPressed});

  bool isActive;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 60,
          width: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                disabledBackgroundColor: const Color(0xffD3D3D3),
                disabledForegroundColor: Colors.white,
                elevation: 0,
                backgroundColor: const Color(0xff008CDC),
                foregroundColor: Colors.white,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: isActive == false ? null : onPressed,
            child: const Text(
              'نشر',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
