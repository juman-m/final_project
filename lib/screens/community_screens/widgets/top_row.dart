import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class TopRow extends StatelessWidget {
  TopRow({super.key, required this.controller, required this.onTap});
  TextEditingController controller;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: TextField(
              onChanged: (text) {
                context.read<CommunityBloc>().add(SearchEvent(text: text));
              },
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.black,
                ),
                hintText: 'ابحث',
                hintStyle: const TextStyle(color: Color(0xff869096)),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffC9C9C9),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffC9C9C9),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/my-parti.svg',
            height: 40,
            width: 40,
          ),
        )
      ],
    );
  }
}
