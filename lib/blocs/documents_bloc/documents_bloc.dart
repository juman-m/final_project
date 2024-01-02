import 'package:bloc/bloc.dart';
import 'package:final_project/models/tooth_model.dart';
import 'package:final_project/services/supabase_teeth_request.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'documents_event.dart';
part 'documents_state.dart';

class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  DocumentsBloc() : super(DocumentsInitial()) {
    on<DocumentsEvent>((event, emit) async {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser!.id;
      List<Tooth> teethList = await getToothStatus(userId);
      List<Tooth> teethListReport = [];
      List<Tooth> teethListXray = [];
      List<Tooth> teethListPrescription = [];
      for (var element in teethList) {
        if (element.report != "") {
          teethListReport.add(element);
        }
        if (element.xray != "") {
          teethListXray.add(element);
        }
        if (element.prescription != "") {
          teethListPrescription.add(element);
        }
      }
      emit(DocumentsViewState(
          teethListReport, teethListXray, teethListPrescription));
    });
  }
}
