import 'package:final_project/models/appointment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future createAppointment(Map body) async {
  final supabase = Supabase.instance.client;
  final List rowId = await supabase.from('appointments').insert(body).select();
  return rowId.first['id'];
}

Future<List<AppointmentModel>> getAppointments() async {
  final supabase = Supabase.instance.client;
  final userId = supabase.auth.currentUser!.id;
  final body = await supabase
      .from('appointments')
      .select()
      .eq('user_id', userId)
      .order('date', ascending: true);

  List<AppointmentModel> listOfObjects = [];

  for (var appointment in body) {
    listOfObjects.add(AppointmentModel.fromJson(appointment));
  }
  return listOfObjects;
}

Future editAppointment(Map body) async {
  final supabase = Supabase.instance.client;
  await supabase.from('appointments').update(body).eq('id', body['id']);
}

Future rescheduleAppointment(Map body) async {
  final supabase = Supabase.instance.client;
  await supabase.from('appointments').update(body).eq('id', body['id']);
}

Future deleteAppointment(int id) async {
  final supabase = Supabase.instance.client;
  await supabase.from('appointments').delete().eq('id', id);
}
