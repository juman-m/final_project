import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';

class StatusPreview extends StatelessWidget {
  const StatusPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Color(0xffCE2164),
                  shape: OvalBorder(),
                ),
              ),
              width8(),
              const SizedBox(
                width: 68,
                child: Text(
                  'جراحة دواعم',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 0.15,
                  ),
                ),
              ),
              width16(),
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Color(0xff9F571C),
                  shape: OvalBorder(),
                ),
              ),
              width8(),
              const Text(
                'تلبيس',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 0.15,
                ),
              ),
              width16(),
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Color(0xffB322C0),
                  shape: OvalBorder(),
                ),
              ),
              width8(),
              const Text(
                'علاج قناة الجذر ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 0.15,
                ),
              ),
            ],
          ),
          height14(),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Color(0xff393C3E),
                  shape: OvalBorder(),
                ),
              ),
              width8(),
              const SizedBox(
                width: 68,
                child: Text(
                  'خلع',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 0.15,
                  ),
                ),
              ),
              width16(),
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Color(0xff7644CC),
                  shape: OvalBorder(),
                ),
              ),
              width8(),
              const SizedBox(
                width: 32,
                child: Text(
                  'زراعة',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 0.15,
                  ),
                ),
              ),
              width16(),
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Color(0xffE91212),
                  shape: OvalBorder(),
                ),
              ),
              width8(),
              const Text(
                'حشوة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 0.15,
                ),
              )
            ],
          ),
          height14(),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Color(0xff9C6871),
                  shape: OvalBorder(),
                ),
              ),
              width8(),
              const SizedBox(
                width: 68,
                child: Text(
                  'أكثر من إجراء',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 0.15,
                  ),
                ),
              ),
              width16(),
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Color(0xff0D7E77),
                  shape: OvalBorder(),
                ),
              ),
              width8(),
              const SizedBox(
                width: 32,
                child: Text(
                  'أخرى',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 0.15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
