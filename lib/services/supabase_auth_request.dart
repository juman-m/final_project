import 'package:final_project/models/appointment_model.dart';
import 'package:final_project/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunctions {
  Future<void> getUsers() async {
    try {
      final supabase = Supabase.instance.client;
      final List<dynamic> data = (await supabase.from('users').select('*'));

      // print(data);
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  useradd(Map body) async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from("users").insert(body).select();
    final UserModel user = UserModel.fromJson(response[0]);
    return user;
  }

  Future<UserModel> getUser() async {
    final supabase = Supabase.instance.client;
    await Future.delayed(const Duration(seconds: 1));
    final String id = Supabase.instance.client.auth.currentUser!.id;
    final response = await supabase.from("users").select('*').eq('id', id);
    final UserModel user = UserModel.fromJson(response[0]);
    return user;
  }

  Future createAppointment(Map body) async {
    final supabase = Supabase.instance.client;
    await supabase.from('appointments').insert(body);
  }

  Future<List<AppointmentModel>> getAppointments() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;
    final body = await supabase
        .from('appointments')
        .select()
        .eq('user_id', userId)
        .order('date');

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
}
