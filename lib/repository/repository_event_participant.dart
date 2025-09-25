import 'package:supabase_flutter/supabase_flutter.dart';

class RepositoryEventParticipant {
  RepositoryEventParticipant({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;
}
