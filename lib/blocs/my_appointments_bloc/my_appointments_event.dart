import 'package:flutter/material.dart';

abstract class MyAppointmentsEvent {}

class TestEvent extends MyAppointmentsEvent {}

/// ================ Get Appointment ==============
class GetAppointmentsEvent extends MyAppointmentsEvent {}

/// ================ Create Appointment ==============
class SelectCategoryEvent extends MyAppointmentsEvent {
  final int index;
  SelectCategoryEvent({required this.index});
}

class SelectDateEvent extends MyAppointmentsEvent {
  DateTime date;
  SelectDateEvent({required this.date});
}

class SelectTimeEvent extends MyAppointmentsEvent {
  final TimeOfDay? time;
  final List? formattedTime;
  SelectTimeEvent({
    this.time,
    this.formattedTime,
  });
}

class SubmitEvent extends MyAppointmentsEvent {
  final int selectedCategory;
  final String description;
  final DateTime selectedDate;
  final TimeOfDay? selectedTime;
  SubmitEvent({
    required this.selectedCategory,
    required this.description,
    required this.selectedDate,
    this.selectedTime,
  });
}

class EditEvent extends MyAppointmentsEvent {
  final int id;
  final int selectedCategory;
  final String description;
  final DateTime selectedDate;
  final TimeOfDay? selectedTime;
  EditEvent({
    required this.id,
    required this.selectedCategory,
    required this.description,
    required this.selectedDate,
    this.selectedTime,
  });
}

class DeleteEvent extends MyAppointmentsEvent {
  final int id;

  DeleteEvent({required this.id});
}

class RescheduleEvent extends MyAppointmentsEvent {
  final int id;

  final DateTime selectedDate;
  final TimeOfDay? selectedTime;
  RescheduleEvent({
    required this.id,
    required this.selectedDate,
    required this.selectedTime,
  });
}
