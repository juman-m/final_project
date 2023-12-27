import 'package:bloc/bloc.dart';
import 'package:final_project/screens/teeth_screens/teeth_screen.dart';
import 'package:flutter/material.dart';

part 'teeth_screen_event.dart';
part 'teeth_screen_state.dart';

class TeethScreenBloc extends Bloc<TeethScreenEvent, TeethScreenState> {
  TeethScreenBloc() : super(TeethScreenInitial()) {
    on<TeethScreenColorsEvent>((event, emit) async {
      emit(TeethScreenLoadingState());
      List<Color> teethColors = await colorStatus();
      emit(TeethScreenColorsState(teethColors));
    });
  }
}
