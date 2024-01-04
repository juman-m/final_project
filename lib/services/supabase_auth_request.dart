import 'dart:developer';

import 'package:final_project/models/appointment_model.dart';
import 'package:final_project/models/comments_model.dart';
import 'package:final_project/models/community_model.dart';
import 'package:final_project/models/notification_model.dart';
import 'package:final_project/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunctions {
  Future<void> getUsers() async {
    try {
      final supabase = Supabase.instance.client;
      (await supabase.from('users').select('*'));

      // print(data);
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

// Future<void> requestPasswordReset(String email) async {
//   try {
//     final supabase = Supabase.instance.client;

//
//     await supabase.auth.resetPasswordForEmail(email);
//     print('Password reset email sent successfully');
//   } catch (error) {
//     print('Error sending password reset email: $error');
//
//   }
// }

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
    final List rowId =
        await supabase.from('appointments').insert(body).select();
    log('===${rowId.first['id']}');
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

  Future publishParticipation(Map body) async {
    final supabase = Supabase.instance.client;
    await supabase.from('community').insert(body);
  }

  Future currentUserInfo() async {
    final supabase = Supabase.instance.client;
    await supabase
        .from('users')
        .select()
        .eq("id", supabase.auth.currentUser!.id);
  }

  Future<List<CommunityModel>> getCommuinties(String city) async {
    final supabase = Supabase.instance.client;
    final List<CommunityModel> communityObjectsList = [];
    final community =
        await supabase.from('community').select().eq("city", city.trim());
    for (var element in community) {
      communityObjectsList.add(CommunityModel.fromJson(element));
    }
    return communityObjectsList;
  }

  getMyParticipations() async {
    final supabase = Supabase.instance.client;
    final List<CommunityModel> communityObjectsList = [];
    final community = await supabase
        .from('community')
        .select()
        .eq("user_id", supabase.auth.currentUser!.id);
    for (var element in community) {
      communityObjectsList.add(CommunityModel.fromJson(element));
    }
    return communityObjectsList;
  }

  Future<List<CommunityModel>> searchForParticipation(String text) async {
    final supabase = Supabase.instance.client;
    final List<CommunityModel> communityObjectsList = [];
    final body =
        await supabase.from('community').select().ilike('content', '%$text%');

    for (var element in body) {
      communityObjectsList.add(CommunityModel.fromJson(element));
    }
    return communityObjectsList;
  }

  Future<List<CommentModel>> getComments(int communityId) async {
    final supabase = Supabase.instance.client;
    final comments = await supabase
        .from('comments')
        .select()
        .eq('community_id', communityId);
    final List<CommentModel> commentsObjectsList = [];
    for (var element in comments) {
      commentsObjectsList.add(CommentModel.fromJson(element));
    }

    log('===${comments.toString()}');
    log('==${commentsObjectsList.toString()}');
    return commentsObjectsList;
    // log('===${comments.length.toString()}===');
    // final commentsAsStream = supabase
    //     .from('comments')
    //     .stream(primaryKey: ['id'])
    //     .eq('community_id', communityId)
    //     .map((item) =>
    //         item.where((element) => element['community_id'] == communityId));
    // final commentsAsStreamModel = commentsAsStream.map(
    //     (items) => items.map((item) => CommentModel.fromJson(item)).toList());
    // return commentsAsStreamModel;
  }

  addComment(Map body) async {
    final supabase = Supabase.instance.client;
    await supabase.from('comments').insert(body);
  }

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
}
