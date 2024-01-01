import 'package:supabase_flutter/supabase_flutter.dart';

Future editUser({
  required String name,
  required String phone,


}) async {
  final supabase = Supabase.instance.client;
  await supabase.from('users').update({
    'username': name,
    'phone': phone,
  

  }).eq('id', supabase.auth.currentUser!.id);
}