import 'package:final_project/models/appointment_model.dart';

abstract class MyAppointmentsState {}

final class MyAppointmentsInitial extends MyAppointmentsState {}

final class TestState extends MyAppointmentsState {}

/// ================ Get Appointment ==============
class GetAppointmentsState extends MyAppointmentsState {
  final List<AppointmentModel> listOfAppointments;
  GetAppointmentsState({required this.listOfAppointments});
}

class EmptyAppointmentsState extends MyAppointmentsState {}

class LoadinAppointmentsState extends MyAppointmentsState {}

/// ================ Create Appointment ==============

final class UpdateDateState extends MyAppointmentsState {
  final DateTime selectedDate;
  UpdateDateState({required this.selectedDate});
}

final class UpdateTimeState extends MyAppointmentsState {
  final List formattedTime;
  UpdateTimeState({required this.formattedTime});
}

final class SuccessSubmitState extends MyAppointmentsState {}

final class ErrorState extends MyAppointmentsState {
  final String message;
  ErrorState({required this.message});
}
