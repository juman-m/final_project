import 'package:final_project/models/notification_model.dart';

abstract class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class GetNotificationsState extends NotificationsState {
  final List<NotificationsModel> notificationsObjectsList;

  GetNotificationsState({required this.notificationsObjectsList});
}

// final class EmptyNotificationsState extends NotificationsState {}
