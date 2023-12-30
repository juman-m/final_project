import 'package:final_project/blocs/my_appointments_bloc/my_appointments_bloc.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_event.dart';
import 'package:final_project/models/appointment_model.dart';
import 'package:final_project/screens/create_appoinment_screen/widgets/screen_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.appoinment,
    required this.selectedCategory,
    required this.descriptionController,
    required this.selectedDate,
    required this.selectedTime,
  });

  final AppointmentModel appoinment;
  final int selectedCategory;
  final TextEditingController descriptionController;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScreenButton(
          text: 'تعديل',
          onTap: () {
            context.read<MyAppointmentsBloc>().add(EditEvent(
                  id: appoinment.id!,
                  selectedCategory: selectedCategory,
                  description: descriptionController.text.trim(),
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
                ));
          },
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {
            context
                .read<MyAppointmentsBloc>()
                .add(DeleteEvent(id: appoinment.id!));
            context.read<MyAppointmentsBloc>().add(GetAppointmentsEvent());
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/delete.svg'),
        ),
      ],
    );
  }
}
