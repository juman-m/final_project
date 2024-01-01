import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:final_project/models/tooth_model.dart';
import 'package:final_project/screens/teeth_screens/teeth_screen.dart';
import 'package:final_project/services/supabase_teeth_request.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'teeth_screen_event.dart';
part 'teeth_screen_state.dart';

class TeethScreenBloc extends Bloc<TeethScreenEvent, TeethScreenState> {
  bool isEditReport = false;
  bool isEditXray = false;
  bool isEditPrescription = false;
  TeethScreenBloc() : super(TeethScreenInitial()) {
    on<TeethScreenColorsEvent>((event, emit) async {
      emit(TeethScreenLoadingState());
      List<Color> teethColors = await colorStatus();
      emit(TeethScreenColorsState(teethColors));
    });

    on<TeethStatusDeleteEvent>((event, emit) async {
      emit(TeethDeleteLoadingState());
      try {
        final supabase = Supabase.instance.client;
        final userId = supabase.auth.currentUser!.id;

        final response = await supabase
            .from("teeth_status")
            .select('*')
            .match({'user_id': userId, "tooth_no": event.toothNum});

        final Tooth tooth = Tooth.fromJson(response[0]);
        if (tooth.report != "") {
          await supabase.storage
              .from('ToothImage')
              .remove(['$userId@${event.toothNum}@report.png']);
        }

        if (tooth.prescription != "") {
          await supabase.storage
              .from('ToothImage')
              .remove(['$userId@${event.toothNum}@prescription.png']);
        }
        if (tooth.xray != "") {
          await supabase.storage
              .from('ToothImage')
              .remove(['$userId@${event.toothNum}@xRay.png']);
        }

        await supabase
            .from('teeth_status')
            .delete()
            .match({'user_id': userId, "tooth_no": event.toothNum});
        emit(TeethStatusDeleteState());
      } catch (e) {
        emit(ToothDeleteErrorState("حدث خطأ ما !"));
        print(e);
      }
    });

    on<TeethStatusUpdateEvent>((event, emit) async {
      emit(TeethUpdateLoadingState());
      try {
        if (event.doctorName.isNotEmpty && event.hospitalName.isNotEmpty) {
          final supabase = Supabase.instance.client;
          final userId = supabase.auth.currentUser!.id;
          String xrayImageUrl = "";
          String prescriptionImageUrl = "";
          String reportImageUrl = "";

          if (event.xray != "" && isEditXray) {
            final imageName = '$userId@${event.toothNo}@xRay.png';
            bool isFound = false;
            List<FileObject> list =
                await supabase.storage.from('ToothImage').list(path: '');

            for (var element in list) {
              if (element.name == imageName) {
                isFound = true;
                // print(element.name);
                // print(imageName);
              }
            }
            if (isFound) {
              print("event.xray:${event.xray}");

              print("imageName:$imageName");
              await supabase.storage
                  .from('ToothImage')
                  .update(imageName, File(event.xray));
              xrayImageUrl =
                  supabase.storage.from("ToothImage").getPublicUrl(imageName);
              isFound = false;
            } else {
              await supabase.storage
                  .from("ToothImage")
                  .upload(imageName, File(event.xray));
              xrayImageUrl =
                  supabase.storage.from("ToothImage").getPublicUrl(imageName);
            }
            isEditXray = false;
          } else {
            xrayImageUrl = event.xray;
          }
          if (event.report != "" && isEditReport) {
            final imageName = '$userId@${event.toothNo}@report.png';
            bool isFound = false;
            List<FileObject> list =
                await supabase.storage.from('ToothImage').list(path: '');

            for (var element in list) {
              if (element.name == imageName) {
                isFound = true;
              }
            }

            if (isFound) {
              await supabase.storage
                  .from('ToothImage')
                  .update(imageName, File(event.report));
              reportImageUrl =
                  supabase.storage.from("ToothImage").getPublicUrl(imageName);
              isFound = false;
              print("is change");
            } else {
              await supabase.storage
                  .from("ToothImage")
                  .upload(imageName, File(event.report));
              reportImageUrl =
                  supabase.storage.from("ToothImage").getPublicUrl(imageName);
            }
            isEditReport = false;
          } else {
            reportImageUrl = event.report;
          }
          if (event.prescription != "" && isEditPrescription) {
            final imageName = '$userId@${event.toothNo}@prescription.png';
            bool isFound = false;
            List<FileObject> list =
                await supabase.storage.from('ToothImage').list(path: '');

            for (var element in list) {
              if (element.name == imageName) {
                isFound = true;
                // print(element.name);
                // print(imageName);
              }
            }
            if (isFound) {
              await supabase.storage
                  .from('ToothImage')
                  .update(imageName, File(event.prescription));
              prescriptionImageUrl =
                  supabase.storage.from("ToothImage").getPublicUrl(imageName);
              isFound = false;
            } else {
              print("add new");
              await supabase.storage
                  .from("ToothImage")
                  .upload(imageName, File(event.prescription));
              prescriptionImageUrl =
                  supabase.storage.from("ToothImage").getPublicUrl(imageName);
            }
            isEditPrescription = false;
          } else {
            prescriptionImageUrl = event.prescription;
          }

          await updateToothStatus(body: {
            "user_id": userId,
            "tooth_no": event.toothNo,
            "tooth_status": event.toothStatus,
            "hospital_name": event.hospitalName,
            "doctor_name": event.doctorName,
            "prescription": prescriptionImageUrl,
            "xray": xrayImageUrl,
            "report": reportImageUrl,
            "date": event.date
          }, id: userId, toothNo: event.toothNo);

          emit(TeethStatusUpdateState());
        }
      } catch (e) {
        emit(ToothUpdateErrorState("حدث خطأ ما !"));
        print(e);
      }
    });
  }
}
