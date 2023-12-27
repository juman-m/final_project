import 'package:final_project/screens/create_appoinment_screen/widgets/day_time.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/double_colon.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/time_container.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimeRow extends StatelessWidget {
  TimeRow({
    super.key,
    required this.onTap,
    required this.hourText,
    required this.minuteText,
    required this.day,
    required this.night,
  });
  Function() onTap;
  final String hourText;
  final String minuteText;
  final bool day;
  final bool night;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.55,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Row(
          children: [
            TimeContainer(text: minuteText),
            const DoubleColon(),
            TimeContainer(text: hourText),
            DayTime(text: '  ص', isSelected: day),
            DayTime(text: '  م', isSelected: night),
          ],
        ),
      ),
    );
  }
}
