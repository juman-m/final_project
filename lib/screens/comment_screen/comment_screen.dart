import 'dart:developer';
import 'package:final_project/blocs/community_bloc/community_bloc.dart'; 
import 'package:final_project/models/community_model.dart';
import 'package:final_project/screens/comment_screen/widgets/comment_card.dart';
import 'package:final_project/screens/comment_screen/widgets/screen_app_bar.dart';
import 'package:final_project/screens/comment_screen/widgets/send_row.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/community_bloc/community_event.dart';

// ignore: must_be_immutable
class CommentScreen extends StatelessWidget {
  CommentScreen({super.key, required this.community, required this.direction});
  CommunityModel community;
  final String direction;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: SendRow(
          controller: controller,
          onTap: () {
            log(controller.text);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScreenAppBar(
              title: 'مشاركة',
              onPressed: () {
                if (direction == 'from community') {
                  context.read<CommunityBloc>().add(GetCommunitiesEvent());
                  Navigator.pop(context);
                } else {
                  context.read<CommunityBloc>().add(GetMyParticipationsEvent());
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CommentCard(
                    name: community.participantName!,
                    time: community.time!.format(context),
                    content: community.content!,
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Colors.black),
                  // SizedBox(
                  //   height: MediaQuery.sizeOf(context).height * 0.6,
                  //   child: StreamBuilder(
                  //       stream: SupabaseFunctions().getComments(community.id!),
                  //       builder: (context, snapshot) {
                  //         log(snapshot.data.toString());
                  //         final List<CommentModel> comments = snapshot.data;
                  //         if (snapshot.hasData) {
                  //           return ListView.separated(
                  //             padding:
                  //                 const EdgeInsets.only(top: 8, bottom: 88),
                  //             shrinkWrap: true,
                  //             itemCount: comments.length,
                  //             itemBuilder: (context, i) => CommentCard(
                  //               name: comments[i].participantName!,
                  //               time: comments[i].time!.format(context),
                  //               content: comments[i].content!,
                  //             ),
                  //             separatorBuilder: (context, i) =>
                  //                 const SizedBox(height: 16),
                  //           );
                  //         } else {
                  //           return const SizedBox();
                  //         }
                  //       }),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
