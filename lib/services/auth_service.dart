import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  User? get currentUser => _supabase.auth.currentUser;

  Future<AuthResponse> signInWithEmail(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(email: email, password: password);
      return response;
    } on AuthException catch (e) {
      if (e.message.contains('Email not confirmed')) {
        print('Email not confirmed. Please check your email to confirm your account.');
        // You can provide user-friendly feedback or take appropriate action here
      } else {
        print('Sign-in unexpected error: ${e.message}, statusCode: ${e.statusCode}');
        // Handle other AuthException scenarios
      }
      rethrow; // Rethrow the exception to propagate it further if needed
    } catch (e) {
      print('Sign-in unexpected error: $e');
      rethrow; // Rethrow the exception to propagate it further if needed
    }
  }

  Future<AuthResponse> signUpWithEmail(String email, String password,String name,String phone) async {
    try {
      final response = await _supabase.auth.signUp(email: email, password: password,data:{
        name:name,
        phone:phone,
      });
      //method to make session

      print('Sign-up successful');
      return response;
    } on AuthException catch (e) {
      print('Sign-up error: ${e.message}, statusCode: ${e.statusCode}');
      // Handle specific error cases
      if (e.statusCode == 429) {
        print('Email rate limit exceeded. Please try again later.');
        // Inform the user or take appropriate action
      } else {
        print('Unexpected AuthException during sign-up: $e');
        // Handle other AuthException scenarios
      }
      rethrow; // Rethrow the exception to propagate it further if needed
    } catch (e) {
      print('Unexpected error during sign-up: $e');
      rethrow; // Rethrow the exception to propagate it further if needed
    }
  }

  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
      print('Sign-out successful');
    } catch (e) {
      print('Sign-out unexpected error: $e');
    }
  }
}
