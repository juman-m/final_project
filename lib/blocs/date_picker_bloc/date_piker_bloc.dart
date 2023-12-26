import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'date_piker_event.dart';
part 'date_piker_state.dart';

class DatePikerBloc extends Bloc<DatePikerEvent, DatePikerState> {
  DatePikerBloc() : super(DatePikerInitial()) {
    on<DatePicked>((event, emit) async {
      final DateTime? picked = await showDatePicker(
        context: event.context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color(0xff5DA7DB),
              colorScheme: const ColorScheme.light(
                primary: Colors.white,
                onPrimary: Color(0xff5DA7DB),
                surface: Colors.white,
                onSurface: Color(0xff5DA7DB),
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xff5DA7DB),
                  ),
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        emit(DatePickerUpdated(picked));
      }
    });
  }
}
