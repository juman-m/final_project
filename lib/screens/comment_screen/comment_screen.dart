import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/models/community_model.dart';
import 'package:final_project/screens/comment_screen/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/community_bloc/community_event.dart';

// ignore: must_be_immutable
class CommentScreen extends StatelessWidget {
  CommentScreen({super.key, required this.community});
  CommunityModel community;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScreenAppBar(
              title: 'مشاركة',
              onPressed: () {
                context.read<CommunityBloc>().add(GetCommunitiesEvent());
                Navigator.pop(context);
              },
            ),
            Text(community.content!),
          ],
        ),
      ),
    );
  }
}
