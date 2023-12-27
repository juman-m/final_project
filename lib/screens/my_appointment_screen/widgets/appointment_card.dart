import 'package:final_project/screens/my_appointment_screen/widgets/conut_down_container.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/reschedule_container.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  AppointmentCard({
    super.key,
    required this.onContainerTaped,
    required this.onRescheduleTaped,
    required this.isEnded,
    required this.description,
    required this.date,
    required this.time,
    required this.remaining,
    required this.isTime,
  });
  Function() onContainerTaped;
  Function() onRescheduleTaped;
  final bool isEnded;
  final String description;
  final String date;
  final String time;
  final String remaining;
  final bool isTime;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: 365,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onContainerTaped,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 80,
                width: 7,
                decoration: BoxDecoration(
                    color: const Color(0xff9747FF),
                    borderRadius: BorderRadius.circular(20))),
            Container(
              height: 96,
              width: 355,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(22, 129, 198, 232),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff0086D3))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(description,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.date_range,
                                  color: Color(0xff7A7D7F)),
                              Text('$date\t\t',
                                  style: const TextStyle(
                                      fontSize: 13, color: Color(0xff7A7D7F))),
                              const Icon(Icons.access_time_outlined,
                                  color: Color(0xff7A7D7F)),
                              Text(
                                '\t$time',
                                style: const TextStyle(
                                    fontSize: 13, color: Color(0xff7A7D7F)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isEnded
                        ? RescheduleContainer(
                            onRescheduleTaped: onRescheduleTaped)
                        : CountDownContainer(
                            remaining: remaining,
                            isTime: isTime,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
