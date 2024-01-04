import 'package:final_project/blocs/my_appointments_bloc/my_appointments_bloc.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_event.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_state.dart';
import 'package:final_project/functions/check_expiration.dart';
import 'package:final_project/functions/formatDate.dart';
import 'package:final_project/functions/is_same_day.dart';
import 'package:final_project/functions/remaining_days.dart';
import 'package:final_project/screens/common_widgets/custom_app_bar.dart';
import 'package:final_project/screens/create_appoinment_screen/create_appoinment_screen.dart';
import 'package:final_project/screens/edit_appoinment_screen/edit_appoinment_screen.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/RescheduleDialog.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/appointment_card.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key, this.isFromHome = false});

  final bool isFromHome;
  @override
  Widget build(BuildContext context) {
    context.read<MyAppointmentsBloc>().add(GetAppointmentsEvent());
    return Scaffold(
      appBar: customAppBar('مواعيدي', () => null, false),
      floatingActionButton: FloatinCustomm(
        imageUrl: "assets/اضافة موعد.png",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  BlocBuilder<MyAppointmentsBloc, MyAppointmentsState>(
                    builder: (context, state) {
                      if (state is EmptyAppointmentsState) {
                        return const Center(
                          child: Text(
                            'لا يوجد مواعيد',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xff869096)),
                          ),
                        );
                      } else if (state is LoadingState) {
                        return const Center(
                            child: CircularProgressIndicator(
                                color: Color(0xFF0086D3)));
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
                                              appoinment: state
                                                  .listOfAppointments[i])));
                                },
                                onRescheduleTaped: checkExpiration(
                                            state.listOfAppointments[i].date
                                                .toString(),
                                            state
                                                .listOfAppointments[i].time!) ==
                                        false
                                    ? () {}
                                    : () {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                RescheduleDialog(
                                                    appointmentId: state
                                                        .listOfAppointments[i]
                                                        .id!));
                                      },
                                isTime: isSameDay(state
                                    .listOfAppointments[i].date
                                    .toString()),
                                isEnded: checkExpiration(
                                    state.listOfAppointments[i].date.toString(),
                                    state.listOfAppointments[i].time!),
                                category: state.listOfAppointments[i].category
                                    .toString(),
                                description: state
                                    .listOfAppointments[i].description
                                    .toString(),
                                date: formatDate(state
                                    .listOfAppointments[i].date
                                    .toString()),
                                time: state.listOfAppointments[i].time!
                                    .format(context),
                                remaining: isSameDay(state
                                        .listOfAppointments[i].date
                                        .toString())
                                    ? state.listOfAppointments[i].time!
                                        .format(context)
                                    : remainingDays(state
                                        .listOfAppointments[i].date
                                        .toString()),
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
            )
          ],
        ),
      ),
    );
  }
}
