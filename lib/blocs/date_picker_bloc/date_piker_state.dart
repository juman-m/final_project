part of 'date_piker_bloc.dart';

abstract class DatePikerState {}

final class DatePikerInitial extends DatePikerState {}

final class BuildState extends DatePikerState {}

final class DatePickerUpdated extends DatePikerState {
  final DateTime pickedDate;

  DatePickerUpdated(this.pickedDate);
}
