import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseRepository {
  const BaseRepository({required SupabaseClient supabase})
    : _supabase = supabase;

  final SupabaseClient _supabase;

  // Getter protegido para que las subclases accedan
  SupabaseClient get supabase => _supabase;
}
