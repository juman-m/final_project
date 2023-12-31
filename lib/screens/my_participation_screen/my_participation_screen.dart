import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:final_project/blocs/community_bloc/community_state.dart';
import 'package:final_project/screens/comment_screen/comment_screen.dart';
import 'package:final_project/screens/common_widgets/custom_app_bar.dart';
import 'package:final_project/screens/community_screens/widgets/community_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyParticipationsScreen extends StatelessWidget {
  const MyParticipationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CommunityBloc>().add(GetMyParticipationsEvent());
    return Scaffold(
      appBar: customAppBar('مشاركاتي', () {
        context.read<CommunityBloc>().add(GetCommunitiesEvent());
        Navigator.pop(context);
      }, true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  BlocBuilder<CommunityBloc, CommunityState>(
                    builder: (context, state) {
                      if (state is EmptyMyParticipationsState) {
                        return const Center(
                          child: Text(
                            'لا يوجد لديك مشاركات',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xff869096)),
                          ),
                        );
                      }
                      if (state is LoadingState) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Color(0xFF0086D3),
                        ));
                      } else if (state is GetMyParticipationsState) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 180),
                            shrinkWrap: true,
                            itemCount: state.communityObjectsList.length,
                            itemBuilder: (context, i) {
                              return CommunityCard(
                                name: state
                                    .communityObjectsList[i].participantName!,
                                time: state.communityObjectsList[i].time!
                                    .format(context),
                                content: state.communityObjectsList[i].content!,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CommentScreen(
                                              direction:
                                                  'from my participations',
                                              community: state
                                                  .communityObjectsList[i])));
                                },
                              );
                            },
                            separatorBuilder: (context, i) {
                              return const SizedBox(height: 16);
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
