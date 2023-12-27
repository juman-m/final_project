abstract class MyAppointmentsState {}

final class MyAppointmentsInitial extends MyAppointmentsState {}

final class TestState extends MyAppointmentsState {}

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
