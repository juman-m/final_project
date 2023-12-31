import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:final_project/functions/picke_image.dart';
import 'package:final_project/services/supabase_teeth_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_tooth_status_event.dart';
part 'add_tooth_status_state.dart';

class AddToothStatusBloc
    extends Bloc<AddToothStatusEvent, AddToothStatusState> {
  AddToothStatusBloc() : super(AddToothStatusInitial()) {
    on<ChangeCategoryFileEvent>((event, emit) async {
      emit(ChangeCategoryFileState());
    });

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
          // final timestamp = DateTime.now().millisecondsSinceEpoch;
          String xrayImageUrl = "";
          String prescriptionImageUrl = "";
          String reportImageUrl = "";

          if (event.xray != "") {
            final imageName = '$userId@${event.toothNo}@xRay.png';
            await supabase.storage
                .from("ToothImage")
                .upload(imageName, File(event.xray));
            xrayImageUrl =
                supabase.storage.from("ToothImage").getPublicUrl(imageName);
            // final imageName = '$userId@${event.toothNo}.png';
            // await supabase.storage
            //     .from("ToothImage/xRay")
            //     .upload(imageName, File(event.xray));
            // xrayImageUrl = supabase.storage
            //     .from("ToothImage/xRay")
            //     .getPublicUrl(imageName);
          }
          if (event.report != "") {
            final imageName = '$userId@${event.toothNo}@report.png';
            await supabase.storage
                .from("ToothImage")
                .upload(imageName, File(event.report));
            reportImageUrl =
                supabase.storage.from("ToothImage").getPublicUrl(imageName);
          }
          if (event.prescription != "") {
            final imageName = '$userId@${event.toothNo}@prescription.png';
            await supabase.storage
                .from("ToothImage")
                .upload(imageName, File(event.prescription));
            prescriptionImageUrl =
                supabase.storage.from("ToothImage").getPublicUrl(imageName);
          }
          await addToothStatus({
            "user_id": userId,
            "tooth_no": event.toothNo,
            "tooth_status": event.toothStatus,
            "hospital_name": event.hospitalName,
            "doctor_name": event.doctorName,
            "prescription": prescriptionImageUrl,
            "xray": xrayImageUrl,
            "report": reportImageUrl,
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
