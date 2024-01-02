import 'package:final_project/models/location_model.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseLocation {
  final supabase = Supabase.instance.client;

  Future<List<LocationModel>> getLocations() async {
    List<LocationModel> locations = [];

    try {
      final locationData = await supabase.from("location").select();

      for (var element in locationData) {
        locations.add(LocationModel.fromJson(element));
      }

      return locations;
    } catch (error) {
      print("Error fetching locations: $error");
      throw error;
    }
  }
}
