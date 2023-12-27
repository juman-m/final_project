import 'package:final_project/models/appointment_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditAppoinment extends StatelessWidget {
  EditAppoinment({super.key, required this.appoinment});
  AppointmentModel appoinment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(appoinment.id.toString()),
      ),
    );
  }
}
