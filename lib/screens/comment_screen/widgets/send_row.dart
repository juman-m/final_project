import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SendRow extends StatelessWidget {
  SendRow({super.key, required this.onTap, required this.controller});
  Function() onTap;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: const Color(0xff869096))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: InkWell(
              onTap: onTap,
              child: const Text(
                'ارسال',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 122,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'اكتب الرسالة'),
            ),
          ),
        ],
      ),
    );
  }
}
