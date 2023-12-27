import 'package:bloc/bloc.dart';

part 'add_tooth_status_event.dart';
part 'add_tooth_status_state.dart';

class AddToothStatusBloc
    extends Bloc<AddToothStatusEvent, AddToothStatusState> {
  AddToothStatusBloc() : super(AddToothStatusInitial()) {
    on<AddToothStatusEvent>((event, emit) {});
  }
}
