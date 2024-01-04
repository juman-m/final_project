import 'dart:developer';

import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:final_project/blocs/community_bloc/community_state.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/models/comments_model.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final now = TimeOfDay.now();
  CommunityBloc() : super(CommunityInitial()) {
    on<ActivateEvent>((event, emit) {
      if (event.text.isNotEmpty) {
        emit(ActivateState(isActive: true));
      } else {
        emit(ActivateState(isActive: false));
      }
    });

    on<PublishEvent>((event, emit) async {
      final supabase = Supabase.instance.client;

      final body = {
        "user_id": supabase.auth.currentUser!.id,
        "content": event.text,
        "city": "الرياض",
        "participant_name": currentUser!.username,
        "time": now.hour < 10 && now.minute < 10
            ? "0${now.hour}:0${now.minute}"
            : now.hour < 10
                ? "0${now.hour}:${now.minute}"
                : now.minute < 10
                    ? "${now.hour}:0${now.minute}"
                    : "${now.hour}:${now.minute}",
      };
      await SupabaseFunctions().publishParticipation(body);
      emit(PublishState());
    });
    on<GetCommunitiesEvent>((event, emit) async {
      emit(LoadingState());
      final communityObjectsList =
          await SupabaseFunctions().getCommuinties('الرياض');
      if (communityObjectsList.isNotEmpty) {
        emit(GetCommunitiesState(communityObjectsList: communityObjectsList));
      } else {
        emit(EmptyCommunitiesState());
      }
    });
    on<GetMyParticipationsEvent>((event, emit) async {
      emit(LoadingState());
      final communityObjectsList =
          await SupabaseFunctions().getMyParticipations();
      if (communityObjectsList.isNotEmpty) {
        emit(GetMyParticipationsState(
            communityObjectsList: communityObjectsList));
      } else {
        emit(EmptyMyParticipationsState());
      }
    });

    on<SearchEvent>((event, emit) async {
      emit(LoadingState());
      final communityObjectsList =
          await SupabaseFunctions().getMyParticipations();
      final searchCommunityObjectsList =
          await SupabaseFunctions().searchForParticipation(event.text);
      if (event.text.isEmpty) {
        emit(GetCommunitiesState(communityObjectsList: communityObjectsList));
      } else {
        if (searchCommunityObjectsList.isNotEmpty) {
          emit(SearchedParticipationsState(
              communityObjectsList: searchCommunityObjectsList));
        } else {
          emit(EmptySearchedParticipationsState(
              message: 'لايوجد مشاركات تحتوي على\'${event.text}\''));
        }
      }
    });

    on<GetCommentEvent>((event, emit) async {
      emit(LoadingCommentsState());
      final List<CommentModel> commentsList =
          await SupabaseFunctions().getComments(event.id);
      emit(GetCommentState(commentsList: commentsList));
    });

    on<AddCommentEvent>((event, emit) async {
      List<CommentModel> currentList = event.currentCommentsList;
      log(event.content);
      log(event.participantName);
      log(event.currentCommentsList.length.toString());
      currentList.add(CommentModel(
          communityId: event.communityId,
          communityParticipantId: event.communityParticipantId,
          participantName: event.participantName,
          content: event.content,
          time: now));
      emit(AddCommentState(newCommentsList: currentList));

      Map body = {
        "community_id": event.communityId,
        "community_participant_id": event.communityParticipantId,
        "participant_name": event.participantName,
        "content": event.content,
        "time": now.hour < 10 && now.minute < 10
            ? "0${now.hour}:0${now.minute}"
            : now.hour < 10
                ? "0${now.hour}:${now.minute}"
                : now.minute < 10
                    ? "${now.hour}:0${now.minute}"
                    : "${now.hour}:${now.minute}",
      };
      await SupabaseFunctions().addComment(body);
      Map notiBody = {
        "community_id": event.communityId,
        "user_id": event.communityParticipantId,
        "content": '${event.participantName} رد على سؤالك',
        "date":
            '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
        "type": "1",
        "time": now.hour < 10 && now.minute < 10
            ? "0${now.hour}:0${now.minute}"
            : now.hour < 10
                ? "0${now.hour}:${now.minute}"
                : now.minute < 10
                    ? "${now.hour}:0${now.minute}"
                    : "${now.hour}:${now.minute}"
      };
      await SupabaseFunctions().addNoti(notiBody);
    });
  }
}
