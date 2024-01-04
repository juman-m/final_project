import 'package:final_project/blocs/my_appointments_bloc/my_appointments_event.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_state.dart';
import 'package:final_project/models/appointment_model.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyAppointmentsBloc
    extends Bloc<MyAppointmentsEvent, MyAppointmentsState> {
  DateTime selectedDate = DateTime.now();
  List? formattedTime;

  MyAppointmentsBloc() : super(MyAppointmentsInitial()) {
    on<SelectCategoryEvent>((event, emit) {
      emit(UpdateCategoryState(selectedCategory: event.index));
    });
    on<SelectDateEvent>((event, emit) {
      selectedDate = event.date;
      emit(UpdateDateState(selectedDate: selectedDate));
    });
    on<SelectTimeEvent>((event, emit) {
      formattedTime = event.time != null ? event.formattedTime : null;
      emit(UpdateTimeState(formattedTime: formattedTime!));
    });
    on<SubmitEvent>((event, emit) async {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser!.id;
      if (event.selectedCategory < 0) {
        emit(ErrorState(message: 'يجب إختيار تصنيف'));
      } else if (event.description.isEmpty) {
        emit(ErrorState(message: 'يجب إدخال وصف للموعد'));
      } else if (event.selectedTime == null) {
        emit(ErrorState(message: 'يجب إختيار الوقت'));
      } else {
        formattedTime = null;
        final body = {
          "user_id": userId,
          "category": event.selectedCategory,
          "description": event.description,
          "date": event.selectedDate.toString(),
          "time": event.selectedTime!.hour < 10 &&
                  event.selectedTime!.minute < 10
              ? "0${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
              : event.selectedTime!.hour < 10
                  ? "0${event.selectedTime!.hour}:${event.selectedTime!.minute}"
                  : event.selectedTime!.minute < 10
                      ? "${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
                      : "${event.selectedTime!.hour}:${event.selectedTime!.minute}"
        };
        final rowId = await SupabaseFunctions().createAppointment(body);
        emit(SuccessSubmitState());
        add(GetAppointmentsEvent());
        Map notiBody = {
          "appointment_id": rowId,
          "user_id": userId,
          "content": event.description,
          "date": event.selectedDate.toString(),
          "type": "0",
          "time": event.selectedTime!.hour < 10 &&
                  event.selectedTime!.minute < 10
              ? "0${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
              : event.selectedTime!.hour < 10
                  ? "0${event.selectedTime!.hour}:${event.selectedTime!.minute}"
                  : event.selectedTime!.minute < 10
                      ? "${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
                      : "${event.selectedTime!.hour}:${event.selectedTime!.minute}"
        };
        await SupabaseFunctions().addNoti(notiBody);
      }
    });

    on<EditEvent>((event, emit) async {
      if (event.selectedCategory < 0) {
        emit(ErrorState(message: 'يجب إختيار تصنيف'));
      } else if (event.description.isEmpty) {
        emit(ErrorState(message: 'يجب إدخال وصف للموعد'));
      } else if (event.selectedTime == null) {
        emit(ErrorState(message: 'يجب إختيار الوقت'));
      } else {
        final body = {
          "id": event.id,
          "category": event.selectedCategory,
          "description": event.description,
          "date": event.selectedDate.toString(),
          "time": event.selectedTime!.hour < 10 &&
                  event.selectedTime!.minute < 10
              ? "0${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
              : event.selectedTime!.hour < 10
                  ? "0${event.selectedTime!.hour}:${event.selectedTime!.minute}"
                  : event.selectedTime!.minute < 10
                      ? "${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
                      : "${event.selectedTime!.hour}:${event.selectedTime!.minute}"
        };
        await SupabaseFunctions().editAppointment(body);
        emit(SuccessSubmitState());
        add(GetAppointmentsEvent());

        Map notiBody = {
          "appointment_id": event.id,
          "content": event.description,
          "date": event.selectedDate.toString(),
          "time": event.selectedTime!.hour < 10 &&
                  event.selectedTime!.minute < 10
              ? "0${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
              : event.selectedTime!.hour < 10
                  ? "0${event.selectedTime!.hour}:${event.selectedTime!.minute}"
                  : event.selectedTime!.minute < 10
                      ? "${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
                      : "${event.selectedTime!.hour}:${event.selectedTime!.minute}"
        };
        await SupabaseFunctions().updateAppointmentNoti(notiBody);
      }
    });

    on<RescheduleEvent>((event, emit) async {
      if (event.selectedTime == null) {
        emit(ErrorState(message: 'يجب إختيار الوقت'));
      } else {
        final body = {
          "id": event.id,
          "date": event.selectedDate.toString(),
          "time": event.selectedTime!.hour < 10 &&
                  event.selectedTime!.minute < 10
              ? "0${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
              : event.selectedTime!.hour < 10
                  ? "0${event.selectedTime!.hour}:${event.selectedTime!.minute}"
                  : event.selectedTime!.minute < 10
                      ? "${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
                      : "${event.selectedTime!.hour}:${event.selectedTime!.minute}"
        };
        await SupabaseFunctions().rescheduleAppointment(body);
        emit(SuccessRescheduleState());
        add(GetAppointmentsEvent());
        Map notiBody = {
          "appointment_id": event.id,
          "date": event.selectedDate.toString(),
          "time": event.selectedTime!.hour < 10 &&
                  event.selectedTime!.minute < 10
              ? "0${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
              : event.selectedTime!.hour < 10
                  ? "0${event.selectedTime!.hour}:${event.selectedTime!.minute}"
                  : event.selectedTime!.minute < 10
                      ? "${event.selectedTime!.hour}:0${event.selectedTime!.minute}"
                      : "${event.selectedTime!.hour}:${event.selectedTime!.minute}"
        };
        await SupabaseFunctions().updateAppointmentNoti(notiBody);
      }
    });

    on<GetAppointmentsEvent>((event, emit) async {
      final List<AppointmentModel> appointmentList =
          await SupabaseFunctions().getAppointments();
      if (appointmentList.isEmpty) {
        emit(EmptyAppointmentsState());
      } else {
        emit(GetAppointmentsState(listOfAppointments: appointmentList));
      }
    });

    on<DeleteEvent>((event, emit) async {
      await await SupabaseFunctions().deleteAppointment(event.id);
      emit(SuccessDeleteState());
      add(GetAppointmentsEvent());
      await SupabaseFunctions().deleteAppointmentNoti(event.id);
    });
  }
}
