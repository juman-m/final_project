import 'package:final_project/models/notification_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<NotificationsModel>> getNotifications() async {
  final supabase = Supabase.instance.client;
  final notifications = await supabase
      .from('notifications')
      .select()
      .eq('user_id', supabase.auth.currentUser!.id);
  final List<NotificationsModel> notificationObjectsList = [];
  for (var element in notifications) {
    notificationObjectsList.add(NotificationsModel.fromJson(element));
  }
  return notificationObjectsList;
}

addNoti(Map body) async {
  await Supabase.instance.client.from('notifications').insert(body);
}

updateAppointmentNoti(Map body) async {
  await Supabase.instance.client
      .from('notifications')
      .update(body)
      .eq('appointment_id', body['appointment_id']);
}

deleteAppointmentNoti(int id) async {
  await Supabase.instance.client
      .from('notifications')
      .delete()
      .eq('appointment_id', id);
}
