import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = "https://yxmwuxrzqndcjnirvwtn.supabase.co";
  static const String supabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl4bXd1eHJ6cW5kY2puaXJ2d3RuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTkyMDQ4NDEsImV4cCI6MjAzNDc4MDg0MX0.cHdivR6hy3v0-4gDLjkhIkWbVO5UIQGHlj_B5r1QkIE";
}

Future<void> initSupabase() async {
  try {
    await Supabase.initialize(
        url: SupabaseConfig.supabaseUrl, anonKey: SupabaseConfig.supabaseAnonKey,
      debug: true,);

    print('Supabase initialized successfully');
    // Continue with further initialization steps or application logic
  } catch (e) {
    print('Error initializing Supabase: $e');
    // Handle initialization error here
    // For example, you could show an error message to the user or retry initialization
  }
}
