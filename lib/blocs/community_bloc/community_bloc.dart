import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:final_project/blocs/community_bloc/community_state.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
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
      final now = TimeOfDay.now();
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
      final communityObjectsList =
          await SupabaseFunctions().getCommuinties('الرياض');
      if (communityObjectsList.isNotEmpty) {
        emit(GetCommunitiesState(communityObjectsList: communityObjectsList));
      } else {
        emit(EmptyCommunitiesState());
      }
    });
    on<GetMyParticipationsEvent>((event, emit) async {
      final communityObjectsList =
          await SupabaseFunctions().getMyParticipations();
      if (communityObjectsList.isNotEmpty) {
        emit(GetMyParticipationsState(
            communityObjectsList: communityObjectsList));
      } else {
        emit(EmptyMyParticipationsState());
      }
    });
  }
}
