import 'package:bloc/bloc.dart';
import 'package:final_project/models/tooth_model.dart';
import 'package:final_project/screens/teeth_screens/teeth_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'teeth_screen_event.dart';
part 'teeth_screen_state.dart';

class TeethScreenBloc extends Bloc<TeethScreenEvent, TeethScreenState> {
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
  }
}
