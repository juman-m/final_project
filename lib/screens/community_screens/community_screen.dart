import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:final_project/blocs/community_bloc/community_state.dart';
import 'package:final_project/screens/comment_screen/comment_screen.dart';
import 'package:final_project/screens/community_screens/widgets/community_card.dart';
import 'package:final_project/screens/community_screens/widgets/screen_app_bar.dart';
import 'package:final_project/screens/community_screens/widgets/top_row.dart';
import 'package:final_project/screens/create_participation_screen/create_participation_screen.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/fab.dart';
import 'package:final_project/screens/my_participation_screen/my_participation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    context.read<CommunityBloc>().add(GetCommunitiesEvent());
    return Scaffold(
      // appBar: customAppBar('الرياض', () => null, false, true),
      floatingActionButton: FloatinCustomm(
        imageUrl: "assets/Vector.png",
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateParticipationScreen()));
        },
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const ScreenAppBar(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TopRow(
                      controller: controller,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyParticipationsScreen()));
                      }),
                  const SizedBox(height: 24),
                  BlocBuilder<CommunityBloc, CommunityState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is EmptyCommunitiesState) {
                        return const Center(
                          child: Text(
                            'لا يوجد مشاركات حاليا',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xff869096)),
                          ),
                        );
                      } else if (state is EmptySearchedParticipationsState) {
                        return Center(
                          child: Text(state.message,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                        );
                      } else if (state is GetCommunitiesState) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 480),
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
                                              direction: 'from community',
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
                      } else if (state is SearchedParticipationsState) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 480),
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
                                              direction: 'from community',
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
