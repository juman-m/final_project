import 'package:supabase_flutter/supabase_flutter.dart';

class Supabaseloctaion {
  final supabase = Supabase.instance.client;

  getLoction() async {
    final locationdate = await supabase.from("loctaion").select();
    print(locationdate);

    // for (var element in locationdate) {

    // locations.add()

    // }
  }
}
