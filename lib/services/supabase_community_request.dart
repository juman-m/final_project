import 'package:final_project/models/comments_model.dart';
import 'package:final_project/models/community_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  final comments =
      await supabase.from('comments').select().eq('community_id', communityId);
  final List<CommentModel> commentsObjectsList = [];
  for (var element in comments) {
    commentsObjectsList.add(CommentModel.fromJson(element));
  }
  return commentsObjectsList;
}

addComment(Map body) async {
  final supabase = Supabase.instance.client;
  await supabase.from('comments').insert(body);
}

Future publishParticipation(Map body) async {
  final supabase = Supabase.instance.client;
  await supabase.from('community').insert(body);
}
