part of 'add_tooth_status_bloc.dart';

final class AddToothStatusEvent {
  final String userId;
  final String toothNo;
  final String toothStatus;
  final String hospitalName;
  final String doctorName;
  final String prescription;
  final String xray;
  final String report;
  final String date;

  AddToothStatusEvent(
      this.userId,
      this.toothNo,
      this.toothStatus,
      this.hospitalName,
      this.doctorName,
      this.prescription,
      this.xray,
      this.report,
      this.date);
}
