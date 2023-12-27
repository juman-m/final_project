part of 'teeth_screen_bloc.dart';

abstract class TeethScreenState {}

final class TeethScreenInitial extends TeethScreenState {}

final class TeethScreenLoadingState extends TeethScreenState {}

final class TeethScreenColorsState extends TeethScreenState {
  final List<Color> teethColors;

  TeethScreenColorsState(this.teethColors);
}
