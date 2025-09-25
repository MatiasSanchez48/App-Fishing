import 'package:supabase_flutter/supabase_flutter.dart';

class RepositoryEventComment {
  RepositoryEventComment({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;
}
