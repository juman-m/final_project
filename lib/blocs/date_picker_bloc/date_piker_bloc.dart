import 'package:bloc/bloc.dart';

part 'date_piker_event.dart';
part 'date_piker_state.dart';

class DatePikerBloc extends Bloc<DatePikerEvent, DatePikerState> {
  DatePikerBloc() : super(DatePikerInitial()) {
    on<DatePicked>((event, emit) async {
      emit(DatePickerUpdated(event.dateTime));
    });
  }
}
