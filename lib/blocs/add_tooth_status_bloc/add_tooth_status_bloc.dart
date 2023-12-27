import 'package:bloc/bloc.dart';
import 'package:final_project/services/supabase_teeth_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_tooth_status_event.dart';
part 'add_tooth_status_state.dart';

class AddToothStatusBloc
    extends Bloc<AddToothStatusEvent, AddToothStatusState> {
  AddToothStatusBloc() : super(AddToothStatusInitial()) {
    on<AddToothStatusEvent>((event, emit) async {
      print("heere");
      emit(AddStatusLoadingState());
      print("heere2");
      try {
        if (event.date.isNotEmpty &&
            event.hospitalName.isNotEmpty &&
            event.toothNo.isNotEmpty &&
            event.doctorName.isNotEmpty &&
            event.userId.isNotEmpty &&
            event.toothStatus.isNotEmpty) {
          final supabase = Supabase.instance.client;
          final userId = supabase.auth.currentUser!.id;

          await addToothStatus({
            "user_id": userId,
            "tooth_no": event.toothNo,
            "tooth_status": event.toothStatus,
            "hospital_name": event.hospitalName,
            "doctor_name": event.doctorName,
            "prescription": event.prescription,
            "xray": event.xray,
            "report": event.report,
            "date": event.date
          });
          print("heere3");
          emit(ToothStatusAddedState());
        } else {
           print("heere4");
          emit(ToothStatusErrorState("الرجاء إدخال جميع الحقول"));
        }
      } catch (e) {
        emit(ToothStatusErrorState("حدث خطأ ما !"));
        print(e);
      }
    });
  }
}
