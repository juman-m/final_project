import 'package:supabase_flutter/supabase_flutter.dart';

addToothStatus(Map body) async {
  final supabase = Supabase.instance.client;
  await supabase.from('teeth_status').insert(body);
}

updateToothStatus({required Map body, required String id}) async {
  final supabase = Supabase.instance.client;
  await supabase.from('teeth_status').update(body).eq("id", id);
}
