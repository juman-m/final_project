import 'package:final_project/models/tooth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

addToothStatus(Map body) async {
  final supabase = Supabase.instance.client;
  await supabase.from('teeth_status').insert(body);
}

updateToothStatus(
    {required Map body, required String id, required String toothNo}) async {
  final supabase = Supabase.instance.client;
  await supabase
      .from('teeth_status')
      .update(body)
      .match({'user_id': id, "tooth_no": toothNo});
}

Future<Tooth?> getToothStatusById(String userId, String toothNo) async {
  final supabase = Supabase.instance.client;
  final response = await supabase
      .from("teeth_status")
      .select('*')
      .match({'user_id': userId, "tooth_no": toothNo});
  if (response.isNotEmpty) {
    final Tooth tooth = Tooth.fromJson(response[0]);
    return tooth;
  } else {
    return null;
  }
}

Future<List<Tooth>> getToothStatus(String userId) async {
  final supabase = Supabase.instance.client;
  final response =
      await supabase.from("teeth_status").select('*').eq('user_id', userId);
  List<Tooth> toothList = [];
  for (var element in response) {
    toothList.add(Tooth.fromJson(element));
  }
  return toothList;
}
