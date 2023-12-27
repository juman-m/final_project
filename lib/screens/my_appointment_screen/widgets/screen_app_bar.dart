import 'package:flutter/material.dart';

class ScreenAppBar extends StatelessWidget {
  ScreenAppBar({super.key, required this.title, required this.onPressed});
  final String title;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 140,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: Color(0xff0086D3),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 88,
                  right: 8,
                  top: 8,
                ),
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'مواعيدي',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
