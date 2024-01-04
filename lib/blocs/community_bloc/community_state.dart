import 'package:final_project/models/comments_model.dart';
import 'package:final_project/models/community_model.dart';

abstract class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class ActivateState extends CommunityState {
  final bool isActive;

  ActivateState({required this.isActive});
}

final class LoadingState extends CommunityState {}

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

final class EmptySearchedParticipationsState extends CommunityState {
  final String message;

  EmptySearchedParticipationsState({required this.message});
}

final class SearchedParticipationsState extends CommunityState {
  final List<CommunityModel> communityObjectsList;

  SearchedParticipationsState({required this.communityObjectsList});
}

final class GetCommentState extends CommunityState {
  final List<CommentModel> commentsList;

  GetCommentState({required this.commentsList});
}

final class LoadingCommentsState extends CommunityState {}

final class AddCommentState extends CommunityState {
  final List<CommentModel> newCommentsList;

  AddCommentState({required this.newCommentsList});
}
