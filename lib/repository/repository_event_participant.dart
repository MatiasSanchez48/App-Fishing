import 'package:chat_flutter_supabase/models/models.dart';
import 'package:chat_flutter_supabase/repository/base_repository.dart';

class RepositoryEventParticipant extends BaseRepository {
  const RepositoryEventParticipant({required super.supabase});

  Future<List<EventParticipant>> getParticipants(String eventId) async {
    final response = await supabase
        .from('event_participants')
        .select()
        .eq('event_id', eventId);

    return response.map(EventParticipant.fromJson).toList();
  }

  Future<void> joinEvent(int eventId, String userId) async {
    final userId = supabase.auth.currentUser!.id;

    await supabase.from('event_participants').insert({
      'event_id': eventId,
      'user_id': userId,
    });
  }

  Future<void> leaveEvent(int eventId) async {
    final userId = supabase.auth.currentUser!.id;

    await supabase
        .from('event_participants')
        .delete()
        .eq('event_id', eventId)
        .eq('user_id', userId);
  }
}
