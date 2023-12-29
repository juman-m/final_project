import 'package:final_project/blocs/my_appointments_bloc/my_appointments_bloc.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_event.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_state.dart';
import 'package:final_project/functions/check_expiration.dart';
import 'package:final_project/functions/formatDate.dart';
import 'package:final_project/functions/is_same_day.dart';
import 'package:final_project/functions/remaining_days.dart';
import 'package:final_project/screens/create_appoinment_screen/create_appoinment_screen.dart';
import 'package:final_project/screens/edit_appoinment_screen/edit_appoinment_screen.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/RescheduleDialog.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/appointment_card.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/fab.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<MyAppointmentsBloc>().add(GetAppointmentsEvent());
    return Scaffold(
      floatingActionButton: FloatinCustomm(
        imageUrl: "assets/Vector.png",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateAppointmentScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            ScreenAppBar(
                title: 'مواعيدي',
                onPressed: () {
                  Navigator.pop(context);
                }),

            const SizedBox(height: 40),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //         onPressed: () async {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => TestingScreen()));
            //         },
            //         child: const Text('Timer')),
            //     const SizedBox(width: 8),
            //     ElevatedButton(
            //         onPressed: () async {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) =>
            //                       const TestingScreenWithBloc()));
            //         },
            //         child: const Text('TEST BLoC')),
            //     const SizedBox(width: 8),
            //     ElevatedButton(
            //         onPressed: () async {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) =>
            //                       const TestingWithLib(title: 'Meow')));
            //         },
            //         child: const Text('TEST Lib')),
            //   ],
            // ),
            BlocBuilder<MyAppointmentsBloc, MyAppointmentsState>(
              builder: (context, state) {
                if (state is EmptyAppointmentsState) {
                  return const Text(
                    'لا يوجد مواعيد',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  );
                } else if (state is GetAppointmentsState) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.9,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 300),
                      itemCount: state.listOfAppointments.length,
                      itemBuilder: (context, i) {
                        return AppointmentCard(
                          onContainerTaped: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditAppoinment(
                                        appoinment:
                                            state.listOfAppointments[i])));
                          },
                          onRescheduleTaped: checkExpiration(
                                      state.listOfAppointments[i].date
                                          .toString(),
                                      state.listOfAppointments[i].time!) ==
                                  false
                              ? () {}
                              : () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => RescheduleDialog(
                                          appointmentId:
                                              state.listOfAppointments[i].id!));
                                },
                          isTime: isSameDay(
                              state.listOfAppointments[i].date.toString()),
                          isEnded: checkExpiration(
                              state.listOfAppointments[i].date.toString(),
                              state.listOfAppointments[i].time!),
                          category:
                              state.listOfAppointments[i].category.toString(),
                          description: state.listOfAppointments[i].description
                              .toString(),
                          date: formatDate(
                              state.listOfAppointments[i].date.toString()),
                          time:
                              state.listOfAppointments[i].time!.format(context),
                          remaining: isSameDay(
                                  state.listOfAppointments[i].date.toString())
                              ? '05:01:29'
                              : remainingDays(
                                  state.listOfAppointments[i].date.toString()),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(height: 24);
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
