part of 'date_piker_bloc.dart';

abstract class DatePikerEvent {}

class DatePicked extends DatePikerEvent {
  final BuildContext context;
  DatePicked(this.context);
}
