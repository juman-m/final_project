import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CommunityBloc>().add(GetCommunitiesEvent());
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
