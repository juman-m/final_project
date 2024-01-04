part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LoadingState extends LocationState {}

final class SuccessHospitalState extends LocationState {
  final List<LocationModel>? locations;

  SuccessHospitalState(this.locations);
}
final class ErrorState extends LocationState {}