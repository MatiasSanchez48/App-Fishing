import 'package:chat_flutter_supabase/models/models.dart';
import 'package:chat_flutter_supabase/repository/base_repository.dart';

class RepositoryFishingEvent extends BaseRepository {
  const RepositoryFishingEvent({required super.supabase});

  Future<List<FishingEvent>> getAllEvents() async {
    final response = await supabase
        .from('fishing_events')
        .select()
        .order('start_date', ascending: true);

    return response.map(FishingEvent.fromJson).toList();
  }

  Future<FishingEvent?> getEventById(String id) async {
    final response = await supabase
        .from('fishing_events')
        .select()
        .eq('id', id)
        .single();

    return FishingEvent.fromJson(response);
  }

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

      return FishingEvent.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
