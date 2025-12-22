import 'package:chat_flutter_supabase/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepositoryEventComment {
  RepositoryEventComment({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  Future<List<EventComment>> getComments(String eventId) async {
    final response = await _supabase
        .from('event_comments')
        .select()
        .eq('event_id', eventId)
        .order('created_at', ascending: true);

    return response.map(EventComment.fromJson).toList();
  }

  Future<void> addComment(EventComment comment) async {
    await _supabase.from('event_comments').insert(comment.toJson());
  }
}
