import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_state.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/models/comments_model.dart';
import 'package:final_project/models/community_model.dart';
import 'package:final_project/screens/comment_screen/widgets/comment_card.dart';
import 'package:final_project/screens/comment_screen/widgets/community_card.dart';
import 'package:final_project/screens/comment_screen/widgets/send_row.dart';
import 'package:final_project/screens/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/community_bloc/community_event.dart';

// ignore: must_be_immutable
class CommentScreen extends StatelessWidget {
  CommentScreen({super.key, required this.community, required this.direction});
  CommunityModel community;
  final String direction;
  TextEditingController controller = TextEditingController();
  List<CommentModel> commentsList = [];
  @override
  Widget build(BuildContext context) {
    context.read<CommunityBloc>().add(GetCommentEvent(id: community.id!));
    return Scaffold(
      appBar: customAppBar('مشاركة', () {
        if (direction == 'from community') {
          context.read<CommunityBloc>().add(GetCommunitiesEvent());
          Navigator.pop(context);
        } else {
          context.read<CommunityBloc>().add(GetMyParticipationsEvent());
          Navigator.pop(context);
        }
      }, true),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: SendRow(
          controller: controller,
          onTap: () {
            if (controller.text.isNotEmpty) {
              context.read<CommunityBloc>().add(AddCommentEvent(
                    currentCommentsList: commentsList,
                    communityId: community.id!,
                    communityParticipantId: community.userId!,
                    participantName: currentUser!.username!,
                    content: controller.text,
                  ));
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CommunityCard(
                    name: community.participantName!,
                    time: community.time!.format(context),
                    content: community.content!,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<CommunityBloc, CommunityState>(
                    builder: (context, state) {
                      if (state is LoadingCommentsState) {
                        return const CircularProgressIndicator();
                      } else if (state is GetCommentState) {
                        commentsList = state.commentsList;
                        return state.commentsList.isEmpty
                            ? const Text(
                                'لا يوجد تعليقات',
                                style: TextStyle(
                                    fontSize: 22, color: Color(0xff869096)),
                              )
                            : SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                child: ListView.separated(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 120),
                                  shrinkWrap: true,
                                  itemCount: state.commentsList.length,
                                  itemBuilder: (context, i) => CommentCard(
                                    name:
                                        state.commentsList[i].participantName!,
                                    time: state.commentsList[i].time!
                                        .format(context),
                                    content: state.commentsList[i].content!,
                                  ),
                                  separatorBuilder: (context, i) =>
                                      const SizedBox(height: 16),
                                ),
                              );
                      } else if (state is AddCommentState) {
                        commentsList = state.newCommentsList;
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.6,
                          child: ListView.separated(
                            padding: const EdgeInsets.only(top: 8, bottom: 120),
                            shrinkWrap: true,
                            itemCount: commentsList.length,
                            itemBuilder: (context, i) => CommentCard(
                              name: commentsList[i].participantName!,
                              time: commentsList[i].time!.format(context),
                              content: commentsList[i].content!,
                            ),
                            separatorBuilder: (context, i) =>
                                const SizedBox(height: 16),
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
