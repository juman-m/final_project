import 'package:supabase_flutter/supabase_flutter.dart';

supabaseInitialize() async {
  await Supabase.initialize(
    url: "https://eqspqhdigzarbfjbppdg.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxc3BxaGRpZ3phcmJmamJwcGRnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDMxNTg3NjQsImV4cCI6MjAxODczNDc2NH0.eiEydT5WYTg484VRj5ecQA1bFF6XoO1OJPoE3XJgC_E",
  );
}
