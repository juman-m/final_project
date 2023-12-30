// ignore: must_be_immutable
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_bloc.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_event.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_state.dart';
import 'package:final_project/functions/time_splitter.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/screen_button.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/screen_title.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/time_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class RescheduleDialog extends StatelessWidget {
  RescheduleDialog({super.key, required this.appointmentId});
  int appointmentId;
  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime;
  List? formattedTime;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyAppointmentsBloc>();
    return Dialog(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<MyAppointmentsBloc, MyAppointmentsState>(
                  buildWhen: (oldState, newState) {
                    if (newState is UpdateDateState) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    return TableCalendar(
                      locale: "ar",
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      availableGestures: AvailableGestures.all,
                      firstDay: DateTime.now(),
                      focusedDay: bloc.selectedDate,
                      lastDay: DateTime(2030, 12, 31),
                      selectedDayPredicate: (day) =>
                          isSameDay(day, selectedDate),
                      onDaySelected: (day, today) {
                        selectedDate = day;
                        context
                            .read<MyAppointmentsBloc>()
                            .add(SelectDateEvent(date: day));
                        context
                            .read<MyAppointmentsBloc>()
                            .add(GetAppointmentsEvent());
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              ScreenTitle(title: 'الوقت'),
              const SizedBox(height: 16),
              BlocBuilder<MyAppointmentsBloc, MyAppointmentsState>(
                buildWhen: (oldState, newState) {
                  if (newState is UpdateTimeState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  return TimeRow(
                    onTap: () async {
                      await showTimePicker(
                        cancelText: '',
                        barrierDismissible: false,
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dialOnly,
                      ).then(
                        (time) {
                          selectedTime = time;
                          formattedTime =
                              timeSplitter(time: time?.format(context));
                          context.read<MyAppointmentsBloc>().add(
                                SelectTimeEvent(
                                  time: time,
                                  formattedTime: formattedTime,
                                ),
                              );
                          context
                              .read<MyAppointmentsBloc>()
                              .add(GetAppointmentsEvent());
                        },
                      );
                    },
                    hourText: bloc.formattedTime == null
                        ? '00'
                        : bloc.formattedTime![0],
                    minuteText: bloc.formattedTime == null
                        ? '00'
                        : bloc.formattedTime![1],
                    day: bloc.formattedTime != null &&
                            bloc.formattedTime![2].toString().contains('ص')
                        ? true
                        : false,
                    night: bloc.formattedTime != null &&
                            bloc.formattedTime![2].toString().contains('م')
                        ? true
                        : false,
                  );
                },
              ),
              const SizedBox(height: 24),
              BlocListener<MyAppointmentsBloc, MyAppointmentsState>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red,
                        content: Text(
                          state.message,
                          style: const TextStyle(color: Colors.white),
                        )));
                  } else if (state is SuccessSubmitState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 2),
                        backgroundColor: Color(0xff018CDD),
                        content: Text(
                          'تمت إعادة ضبط الموعد',
                          style: TextStyle(color: Colors.white),
                        )));
                  }
                },
                child: ScreenButton(
                  text: 'إعادة ضبط الموعد',
                  onTap: () {
                    context.read<MyAppointmentsBloc>().add(RescheduleEvent(
                          id: appointmentId,
                          selectedDate: selectedDate,
                          selectedTime: selectedTime,
                        ));
                    context
                        .read<MyAppointmentsBloc>()
                        .add(GetAppointmentsEvent());
                    if (selectedTime != null) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
