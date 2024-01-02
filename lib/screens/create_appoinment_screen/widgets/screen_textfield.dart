import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenTextField extends StatelessWidget {
  ScreenTextField({super.key, required this.controller});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: controller.text.length > 28 ? 3 : 1,
      textAlignVertical: const TextAlignVertical(y: 0.8),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffC9C9C9),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffC9C9C9),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
