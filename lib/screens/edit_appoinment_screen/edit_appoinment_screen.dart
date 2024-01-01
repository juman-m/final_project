import 'dart:developer';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_bloc.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_event.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_state.dart';
import 'package:final_project/functions/time_splitter.dart';
import 'package:final_project/models/appointment_model.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/appointment_category.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/cancel_button.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/screen_button.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/screen_textfield.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/screen_title.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/time_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class EditAppoinment extends StatelessWidget {
  EditAppoinment({super.key, required this.appoinment});
  AppointmentModel appoinment;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyAppointmentsBloc>();
    int selectedCategory = int.parse(appoinment.category!);
    TextEditingController descriptionController =
        TextEditingController(text: appoinment.description);
    DateTime selectedDate = DateTime.parse(appoinment.date!);
    TimeOfDay selectedTime = appoinment.time!;
    List formattedTime = timeSplitter(time: appoinment.time!.format(context));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: double.infinity),
              const SizedBox(height: 72),
              const CancelButton(),
              const SizedBox(height: 16),
              ScreenTitle(title: 'التصنيف'),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<MyAppointmentsBloc, MyAppointmentsState>(
                  buildWhen: (oldState, newState) {
                    if (newState is UpdateCategoryState) {
                      selectedCategory = newState.selectedCategory;
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    return AppointmentCategory(
                      selected: selectedCategory,
                      onTap: (i) {
                        context
                            .read<MyAppointmentsBloc>()
                            .add(SelectCategoryEvent(index: i));
                        log(i.toString());
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              ScreenTitle(title: 'وصف الموعد'),
              const SizedBox(height: 24),
              SizedBox(
                height: descriptionController.text.length > 28 ? 64 : 44,
                width: MediaQuery.sizeOf(context).width * 0.60,
                child: ScreenTextField(controller: descriptionController),
              ),
              const SizedBox(height: 24),
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
                          selectedTime = time!;
                          formattedTime =
                              timeSplitter(time: time.format(context));
                          context.read<MyAppointmentsBloc>().add(
                                SelectTimeEvent(
                                  time: time,
                                  formattedTime: formattedTime,
                                ),
                              );
                        },
                      );
                    },
                    hourText: formattedTime[0],
                    minuteText: formattedTime[1],
                    day: formattedTime[2].toString().contains('ص')
                        ? true
                        : false,
                    night: formattedTime[2].toString().contains('م')
                        ? true
                        : false,
                  );
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: BlocListener<MyAppointmentsBloc, MyAppointmentsState>(
                  listener: (context, state) {
                    if (state is ErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            state.message,
                            style: const TextStyle(color: Colors.white),
                          )));
                    } else if (state is SuccessSubmitState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color(0xff018CDD),
                          content: Text(
                            'تم تعديل الموعد',
                            style: TextStyle(color: Colors.white),
                          )));
                    } else if (state is SuccessDeleteState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color(0xff018CDD),
                          content: Text(
                            'تم حذف الموعد',
                            style: TextStyle(color: Colors.white),
                          )));
                    }
                  },
                  child: Row(
                    children: [
                      ScreenButton(
                        text: 'تعديل',
                        onTap: () {
                          context.read<MyAppointmentsBloc>().add(EditEvent(
                                id: appoinment.id!,
                                selectedCategory: selectedCategory,
                                description: descriptionController.text.trim(),
                                selectedDate: selectedDate,
                                selectedTime: selectedTime,
                              ));
                        },
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {
                          context
                              .read<MyAppointmentsBloc>()
                              .add(DeleteEvent(id: appoinment.id!));
                          context
                              .read<MyAppointmentsBloc>()
                              .add(GetAppointmentsEvent());
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset('assets/delete.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
