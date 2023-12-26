part of 'status_chip_bloc.dart';

abstract class StatusChipEvent {}

final class SelectChipEvent extends StatusChipEvent {
  final String title;

  SelectChipEvent(this.title);
}
