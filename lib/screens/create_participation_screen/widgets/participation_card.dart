import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipationCard extends StatelessWidget {
  const ParticipationCard({
    super.key,
    required this.controller,
    required this.name,
  });

  final TextEditingController controller;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0, top: 32),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color.fromARGB(67, 0, 0, 0))),
      child: Padding(
        padding: const EdgeInsets.only(right: 32, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              maxLines: 3,
              onChanged: (value) {
                context.read<CommunityBloc>().add(ActivateEvent(text: value));
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'أريد أن أكتب هنا',
                hintStyle: TextStyle(
                  color: Color(0xffC1C1C1),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
