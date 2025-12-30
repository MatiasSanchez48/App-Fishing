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

  Future<EventParticipant> joinEvent(int eventId) async {
    final userId = supabase.auth.currentUser?.id ?? '';

    final response = await supabase
        .from('event_participants')
        .insert({
          'event_id': eventId,
          'user_id': userId,
        })
        .select('''
      id,
      event_id,
      user_id,
      joined_at,
      users (
        uuid,
        username,
        avatar_url,
        email
      )
    ''')
        .single();

    return EventParticipant.fromJson(response);
  }

  Future<FishingEvent> leaveEvent(int eventId) async {
    final userId = supabase.auth.currentUser!.id;

    await supabase
        .from('event_participants')
        .delete()
        .eq('event_id', eventId)
        .eq('user_id', userId);

    final response = await supabase
        .from('fishing_events')
        .select('''
        *,
        participants:event_participants (
          id,
          event_id,
          user_id,
          joined_at,
          users (
            uuid,
            username,
            avatar_url,
            email
          )
        )
      ''')
        .eq('id', eventId)
        .single();

    return FishingEvent.fromJson(response);
  }
}
