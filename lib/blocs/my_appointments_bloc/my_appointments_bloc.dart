import 'dart:developer';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_event.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_state.dart';
import 'package:final_project/models/appointment_model.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyAppointmentsBloc
    extends Bloc<MyAppointmentsEvent, MyAppointmentsState> {
  /// ================ Create Appointment Variables ==============
  DateTime selectedDate = DateTime.now();
  List? formattedTime;

  /// ================ Create Appointment ==============
  MyAppointmentsBloc() : super(MyAppointmentsInitial()) {
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
      log(event.description);
      if (event.selectedCategory < 0) {
        emit(ErrorState(message: 'يجب إختيار تصنيف'));
      } else if (event.description.isEmpty) {
        emit(ErrorState(message: 'يجب إدخال وصف للموعد'));
      } else if (event.selectedTime == null) {
        emit(ErrorState(message: 'يجب إختيار الوقت'));
      } else {
        // {id: 2, user_id: 0570deee-e1a3-402a-9b95-0879e4626187, category: 1, description: علاج عصب, date: 2023-12-27, time: 18:30:52}
        final body = {
          "user_id": userId,
          "category": event.selectedCategory,
          "description": event.description,
          "date": event.selectedDate.toString(),
          "time": "${event.selectedTime!.hour}:${event.selectedTime!.minute}"
        };
        await SupabaseFunctions().createAppointment(body);
        emit(SuccessSubmitState());
      }
    });

    /// ================ Get Appointment Variables ==============
    ///

    /// ================ Get Appointment ==============
    on<GetAppointmentsEvent>((event, emit) async {
      final List<AppointmentModel> appointmentList =
          await SupabaseFunctions().getAppointments();
      if (appointmentList.isEmpty) {
        emit(EmptyAppointmentsState());
      } else {
        emit(GetAppointmentsState(listOfAppointments: appointmentList));
      }
    });
  }
}
