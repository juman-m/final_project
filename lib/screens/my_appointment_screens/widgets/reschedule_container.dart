import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RescheduleContainer extends StatelessWidget {
  RescheduleContainer({
    super.key,
    required this.onRescheduleTaped,
  });
  Function() onRescheduleTaped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRescheduleTaped,
      child: Container(
        height: 24,
        width: 95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffD66CCF))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'إعادة جدولة',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xffD66CCF),
              ),
            ),
            Icon(Icons.restore_outlined, color: Color(0xffD66CCF)),
          ],
        ),
      ),
    );
  }
}
