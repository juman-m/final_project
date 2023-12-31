part of 'teeth_screen_bloc.dart';

abstract class TeethScreenEvent {}

final class TeethScreenColorsEvent extends TeethScreenEvent {}

final class TeethStatusDeleteEvent extends TeethScreenEvent {
  final String toothNum;

  TeethStatusDeleteEvent(this.toothNum);
}

final class TeethStatusUpdateEvent extends TeethScreenEvent {
  final Tooth tooth;

  TeethStatusUpdateEvent(this.tooth);
}
