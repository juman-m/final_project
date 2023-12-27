import 'package:final_project/screens/create_appoinment_screen/widgets/custom_chip.dart';
import 'package:flutter/material.dart';

class AppointmentCategory extends StatelessWidget {
  const AppointmentCategory(
      {super.key,
      this.selectedChoice = const ['تقويم', 'مراجعة', 'أخرى'],
      required this.selected,
      required this.onTap});

  final List<String> selectedChoice;
  final int selected;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(
        selectedChoice.length,
        (index) => Row(
          children: [
            CustomChip(
              isSelected: index == selected,
              text: selectedChoice[index],
              color: index == 0
                  ? const Color(0xffD66CCF)
                  : index == 1
                      ? const Color(0xff9747FF)
                      : const Color(0xffFFB8B8),
              onTap: onTap,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    ]);
  }
}
