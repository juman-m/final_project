import 'package:final_project/blocs/notifications_bloc/notifications_event.dart';
import 'package:final_project/blocs/notifications_bloc/notifications_state.dart';
import 'package:final_project/services/supabase_notifications_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitial()) {
    on<GetNotificationsEvent>((event, emit) async {
      final notificationsObjectsList = await getNotifications();
      emit(GetNotificationsState(
          notificationsObjectsList: notificationsObjectsList));
    });
  }
}
