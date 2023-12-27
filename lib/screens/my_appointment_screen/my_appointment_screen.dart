import 'dart:developer';

import 'package:final_project/functions/string_to_time_of_day.dart';
import 'package:final_project/screens/my_appointment_screen/test_screen.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/appointment_card.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/fab.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/screen_app_bar.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:flutter/material.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FAB(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ScreenAppBar(),
            ElevatedButton(
                onPressed: () async {
                  // final time = TimeOfDay.now();
                  final appo = await SupabaseFunctions().getAppointments();
                  // final t = stringToTimeOfDay('17:0');

                  log(appo.last.time.toString());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const TestingScreen()));
                },
                child: const Text('TEST')),
            // ListView.separated(
            //   shrinkWrap: true,
            //   itemCount: 2,
            //   itemBuilder: (context, i) {
            //     return AppointmentCard(
            //       isEnded: false,
            //       description: 'مستشفى المسواك',
            //       date: 'الخميس 21 سبتمبر',
            //       time: '6:30 م',
            //       remaining: '\t10\nأيام',
            //     );
            //   },
            //   separatorBuilder: (context, i) {
            //     return const SizedBox(height: 32);
            //   },
            // ),
            const SizedBox(height: 24),
            AppointmentCard(
              onContainerTaped: () {
                log('Edit Me 1');
              },
              onRescheduleTaped: () {},
              isEnded: false,
              description: 'مستشفى المسواك',
              date: 'الخميس 21 سبتمبر',
              time: '6:30 م',
              remaining: '\t10\nأيام',
            ),
            const SizedBox(height: 24),
            AppointmentCard(
              onContainerTaped: () {
                log('Edit Me 2');
              },
              isEnded: true,
              description: 'مستشفى المسواك',
              date: 'السبت 21 سبتمبر',
              time: '10:00 م',
              remaining: '\t10\nأيام',
              onRescheduleTaped: () {
                log('Reschedule Me ');
              },
            ),
          ],
        ),
      ),
    );
  }
}
