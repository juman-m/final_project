part of 'teeth_screen_bloc.dart';

abstract class TeethScreenState {}

final class TeethScreenInitial extends TeethScreenState {}

final class TeethScreenLoadingState extends TeethScreenState {}

final class TeethScreenColorsState extends TeethScreenState {
  final List<Color> teethColors;

  TeethScreenColorsState(this.teethColors);
}

final class TeethStatusDeleteState extends TeethScreenState {}

final class TeethStatusUpdateState extends TeethScreenState {}

final class TeethDeleteLoadingState extends TeethScreenState {}

final class TeethUpdateLoadingState extends TeethScreenState {}

final class ToothDeleteErrorState extends TeethScreenState {
  final String error;

  ToothDeleteErrorState(this.error);
}

final class ToothUpdateErrorState extends TeethScreenState {
  final String error;

  ToothUpdateErrorState(this.error);
}
