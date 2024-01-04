import 'package:bloc/bloc.dart';
import 'package:final_project/models/location_model.dart';
import 'package:final_project/services/supabase_loctaion_request.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  List<LocationModel>? locations;

  LocationBloc() : super(LocationInitial()) {
    on<getHospitalDataEvent>(getData);
  }
  Future<void> getData(
      getHospitalDataEvent event, Emitter<LocationState> emit) async {
    try {
      emit(LoadingState());

      locations = await SupabaseLocation().getLocations();
    } catch (error) {
      print(error);

      emit(ErrorState());
    }
  }
}
