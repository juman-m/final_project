part of 'date_piker_bloc.dart';

abstract class DatePikerEvent {}

class DatePicked extends DatePikerEvent {
  final DateTime dateTime;
  DatePicked(this.dateTime);
}
