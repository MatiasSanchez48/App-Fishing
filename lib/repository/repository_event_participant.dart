import 'package:chat_flutter_supabase/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepositoryEventParticipant {
  RepositoryEventParticipant({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  Future<List<EventParticipant>> getParticipants(String eventId) async {
    final response = await _supabase
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

    await _supabase.from('event_participants').insert(participant.toJson());
  }
}
