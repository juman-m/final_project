import 'package:final_project/blocs/date_picker_bloc/date_piker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickerContainer extends StatelessWidget {
  const DatePickerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141,
      height: 34,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFC8C8C8)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: BlocBuilder<DatePikerBloc, DatePikerState>(
        builder: (context, state) {
          if (state is DatePickerUpdated) {
            return InkWell(
              onTap: () =>
                  context.read<DatePikerBloc>().add(DatePicked(context)),
              child: Center(
                child: Text(
                  "${state.pickedDate.year}-${state.pickedDate.month}-${state.pickedDate.day}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          } else {
            return InkWell(
              onTap: () =>
                  context.read<DatePikerBloc>().add(DatePicked(context)),
              child: const Center(
                child: Text(
                  'DD/MM/YY',
                  style: TextStyle(
                    color: Color(0xFFC5C5C5),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
