import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:final_project/blocs/community_bloc/community_state.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/screens/create_participation_screen/widgets/cancel_button.dart';
import 'package:final_project/screens/create_participation_screen/widgets/participation_card.dart';
import 'package:final_project/screens/create_participation_screen/widgets/publish_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CreateParticipationScreen extends StatelessWidget {
  CreateParticipationScreen({super.key});
  TextEditingController controller = TextEditingController();
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity, height: 100),
            const CancelButton(),
            const SizedBox(width: double.infinity, height: 80),
            ParticipationCard(
              controller: controller,
              name: currentUser!.username!,
            ),
            const SizedBox(height: 16),
            BlocConsumer<CommunityBloc, CommunityState>(
              listener: (context, state) {
                if (state is PublishState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color(0xff018CDD),
                      content: Text(
                        'تمت إضافة المشاركة',
                        style: TextStyle(color: Colors.white),
                      )));
                }
              },
              buildWhen: (oldState, newState) {
                if (newState is ActivateState) {
                  isActive = newState.isActive;
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return PublishButton(
                    isActive: isActive,
                    onPressed: () {
                      context
                          .read<CommunityBloc>()
                          .add(PublishEvent(text: controller.text));
                      context.read<CommunityBloc>().add(GetCommunitiesEvent());
                      Navigator.pop(context);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
