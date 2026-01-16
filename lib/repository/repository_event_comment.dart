import 'package:app_fishing/models/models.dart';
import 'package:app_fishing/repository/base_repository.dart';

class RepositoryEventComment extends BaseRepository {
  const RepositoryEventComment({required super.supabase});

  Future<List<EventComment>> getComments(String eventId) async {
    final response = await supabase
        .from('event_comments')
        .select()
        .eq('event_id', eventId)
        .order('created_at', ascending: true);

    return response.map(EventComment.fromJson).toList();
  }

  Future<void> addComment(EventComment comment) async {
    await supabase.from('event_comments').insert(comment.toJson());
  }
}
