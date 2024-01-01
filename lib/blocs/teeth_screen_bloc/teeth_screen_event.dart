part of 'teeth_screen_bloc.dart';

abstract class TeethScreenEvent {}

final class TeethScreenColorsEvent extends TeethScreenEvent {}

final class TeethStatusDeleteEvent extends TeethScreenEvent {
  final String toothNum;

  TeethStatusDeleteEvent(this.toothNum);
}

final class TeethStatusUpdateEvent extends TeethScreenEvent {
  final String toothNo;
  final String toothStatus;
  final String hospitalName;
  final String doctorName;
  final String prescription;
  final String xray;
  final String report;
  final String date;
  TeethStatusUpdateEvent(this.toothNo, this.toothStatus, this.hospitalName,
      this.doctorName, this.prescription, this.xray, this.report, this.date);
}
