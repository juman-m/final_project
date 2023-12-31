part of 'add_tooth_status_bloc.dart';

abstract class AddToothStatusEvent {}

final class CreateToothStatusEvent extends AddToothStatusEvent {
  final String userId;
  final String toothNo;
  final String toothStatus;
  final String hospitalName;
  final String doctorName;
  final String prescription;
  final String xray;
  final String report;
  final String date;

  CreateToothStatusEvent(
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

final class AddImageEvent extends AddToothStatusEvent {}

final class ChangeCategoryFileEvent extends AddToothStatusEvent {}

final class UpdateImageEvent extends AddToothStatusEvent {
  final String type;

  UpdateImageEvent(this.type);
}
