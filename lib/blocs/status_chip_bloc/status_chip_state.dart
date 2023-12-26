part of 'status_chip_bloc.dart';

abstract class StatusChipState {}

final class StatusChipInitial extends StatusChipState {}

final class StatusChipChangeState extends StatusChipState {
  final String title;

  StatusChipChangeState(this.title);
}
