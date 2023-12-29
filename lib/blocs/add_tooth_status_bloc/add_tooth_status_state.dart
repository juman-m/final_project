part of 'add_tooth_status_bloc.dart';

abstract class AddToothStatusState {}

final class AddToothStatusInitial extends AddToothStatusState {}

final class ToothStatusAddedState extends AddToothStatusState {}

final class AddStatusLoadingState extends AddToothStatusState {}

final class ToothStatusErrorState extends AddToothStatusState {
  final String error;

  ToothStatusErrorState(this.error);
}

final class ImageAddedState extends AddToothStatusState {
  final String? image;

  ImageAddedState(this.image);
}

final class ChangeCategoryFileState extends AddToothStatusState {}
