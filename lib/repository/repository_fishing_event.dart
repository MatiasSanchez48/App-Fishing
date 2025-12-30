import 'package:chat_flutter_supabase/models/models.dart';
import 'package:chat_flutter_supabase/repository/base_repository.dart';
import 'package:chat_flutter_supabase/repository/repository.dart';

class RepositoryFishingEvent extends BaseRepository {
  RepositoryFishingEvent({required super.supabase})
    : _repositoryEventParticipant = RepositoryEventParticipant(
        supabase: supabase,
      );

  final RepositoryEventParticipant _repositoryEventParticipant;

  ///
  Future<List<FishingEvent>> getAllEvents({
    int page = 0,
    int pageSize = 10,
  }) async {
    ///
    final from = page * pageSize;

    ///
    final to = from + pageSize - 1;

    final response = await supabase
        .from('fishing_events')
        .select('''
        *,
        event_participants (
          id,
          event_id,
          user_id,
          joined_at,
          users  (
            uuid,
            username,
            avatar_url
          )
        )
      ''')
        .order('start_date', ascending: true)
        .range(from, to);

    return response.map(FishingEvent.fromJson).toList();
  }

  Future<List<FishingEvent>> getMyEvents({
    int page = 0,
    int pageSize = 10,
  }) async {
    final userId = supabase.auth.currentUser!.id;

    final from = page * pageSize;
    final to = from + pageSize - 1;

    final response = await supabase
        .from('fishing_events')
        .select('''
        *,
        event_participants!inner (
          id,
          event_id,
          user_id,
          joined_at,
          users (
            uuid,
            username,
            avatar_url
          )
        )
      ''')
        .eq('event_participants.user_id', userId)
        .order('start_date', ascending: true)
        .range(from, to);

    return response.map(FishingEvent.fromJson).toList();
  }

  ///
  Future<FishingEvent?> getEventById(int id) async {
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
        .eq('id', id)
        .single();

    return FishingEvent.fromJson(response);
  }

  ///
  Future<FishingEvent> createEvent({required FishingEvent event}) async {
    try {
      // NO incluir 'id', 'created_at', 'updated_at'
      final data = {
        'created_by': event.createdBy,
        'title': event.title,
        'description': event.description,
        'fishing_type': event.fishingType,
        'location': event.location,
        'start_date': event.startDate.toUtc().toIso8601String(),
        'end_date': event.endDate.toUtc().toIso8601String(),
        'departure_time': event.departureTime,
        'status': event.status,
        'image_url': event.imageUrl,
        // ❌ NO enviar: id, created_at, updated_at
      };

      final response = await supabase
          .from('fishing_events')
          .insert(data)
          .select()
          .single();

      final createdEvent = FishingEvent.fromJson(response);

      await _repositoryEventParticipant.joinEvent(createdEvent.id);

      return createdEvent;
    } catch (e) {
      rethrow;
    }
  }

  ///
  Future<void> deleteEvent(int eventId) async {
    await supabase.from('fishing_events').delete().eq('id', eventId);
  }
}
