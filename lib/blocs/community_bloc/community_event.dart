import 'package:final_project/models/comments_model.dart';

abstract class CommunityEvent {}

final class ActivateEvent extends CommunityEvent {
  final String text;

  ActivateEvent({required this.text});
}

final class PublishEvent extends CommunityEvent {
  final String text;

  PublishEvent({required this.text});
}

final class GetCommunitiesEvent extends CommunityEvent {}

final class GetMyParticipationsEvent extends CommunityEvent {}

final class SearchEvent extends CommunityEvent {
  final String text;

  SearchEvent({required this.text});
}

final class GetCommentEvent extends CommunityEvent {
  final int id;

  GetCommentEvent({required this.id});
}

final class AddCommentEvent extends CommunityEvent {
  final List<CommentModel> currentCommentsList;
  final int communityId;
  final String communityParticipantId;
  final String participantName;
  final String content;

  AddCommentEvent({
    required this.currentCommentsList,
    required this.communityId,
    required this.communityParticipantId,
    required this.participantName,
    required this.content,
  });
}
