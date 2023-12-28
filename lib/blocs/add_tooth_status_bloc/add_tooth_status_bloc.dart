import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:final_project/services/supabase_teeth_request.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_tooth_status_event.dart';
part 'add_tooth_status_state.dart';

class AddToothStatusBloc
    extends Bloc<AddToothStatusEvent, AddToothStatusState> {
  AddToothStatusBloc() : super(AddToothStatusInitial()) {
    on<CreateToothStatusEvent>((event, emit) async {
      emit(AddStatusLoadingState());
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

          emit(ToothStatusAddedState());
        } else {
          emit(ToothStatusErrorState("الرجاء إدخال جميع الحقول"));
        }
      } catch (e) {
        emit(ToothStatusErrorState("حدث خطأ ما !"));
        print(e);
      }
    });

    on<AddImageEvent>((event, emit) async {
      final String? image = await getImage();
      emit(ImageAddedState(image));
    });
  }
}

Future<String?> getImage() async {
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    imageFile = File(image.path);

    return imageFile.path;
  }
  return null;
}
