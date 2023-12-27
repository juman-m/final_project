import 'package:bloc/bloc.dart';

part 'status_chip_event.dart';
part 'status_chip_state.dart';

class StatusChipBloc extends Bloc<StatusChipEvent, StatusChipState> {
      String selectedStatus = "جراحة و دواعم";

  StatusChipBloc() : super(StatusChipInitial()) {
    on<SelectChipEvent>((event, emit) {
      emit(StatusChipChangeState(event.title));
    });
  }
}
