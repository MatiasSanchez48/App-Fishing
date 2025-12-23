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

  Future<void> joinEvent(int eventId, int userId) async {
    final participant = EventParticipant(
      id: 0, // Supabase genera UUID si la tabla está configurada
      eventId: eventId,
      userId: userId,
      joinedAt: DateTime.now(),
    );

    await supabase.from('event_participants').insert(participant.toJson());
  }
}
