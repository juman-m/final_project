import 'package:final_project/models/community_model.dart';

abstract class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class ActivateState extends CommunityState {
  final bool isActive;

  ActivateState({required this.isActive});
}

final class PublishState extends CommunityState {}

final class GetCommunitiesState extends CommunityState {
  final List<CommunityModel> communityObjectsList;

  GetCommunitiesState({required this.communityObjectsList});
}

final class EmptyCommunitiesState extends CommunityState {}

final class EmptyMyParticipationsState extends CommunityState {}

final class GetMyParticipationsState extends CommunityState {
  final List<CommunityModel> communityObjectsList;

  GetMyParticipationsState({required this.communityObjectsList});
}
