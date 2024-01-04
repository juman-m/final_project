import 'package:final_project/models/appointment_model.dart';

abstract class MyAppointmentsState {}

final class MyAppointmentsInitial extends MyAppointmentsState {}

final class TestState extends MyAppointmentsState {}

class GetAppointmentsState extends MyAppointmentsState {
  final List<AppointmentModel> listOfAppointments;
  GetAppointmentsState({required this.listOfAppointments});
}

class EmptyAppointmentsState extends MyAppointmentsState {}

class LoadinAppointmentsState extends MyAppointmentsState {}

final class UpdateCategoryState extends MyAppointmentsState {
  final int selectedCategory;
  UpdateCategoryState({required this.selectedCategory});
}

final class UpdateDateState extends MyAppointmentsState {
  final DateTime selectedDate;
  UpdateDateState({required this.selectedDate});
}

final class UpdateTimeState extends MyAppointmentsState {
  final List formattedTime;
  UpdateTimeState({required this.formattedTime});
}

final class SuccessSubmitState extends MyAppointmentsState {}

final class SuccessEditState extends MyAppointmentsState {}

final class SuccessRescheduleState extends MyAppointmentsState {}

class SuccessDeleteState extends MyAppointmentsState {}

final class LoadingState extends MyAppointmentsState {}

final class ErrorState extends MyAppointmentsState {
  final String message;
  ErrorState({required this.message});
}
