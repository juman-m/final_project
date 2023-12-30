import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.read<MyAppointmentsBloc>().add(GetAppointmentsEvent());
        Navigator.pop(context);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
            color: Color(0xffE7E6E8), shape: BoxShape.circle),
        child: Center(child: SvgPicture.asset('assets/Union.svg')),
      ),
    );
  }
}
