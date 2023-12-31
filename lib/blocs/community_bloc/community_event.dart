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
