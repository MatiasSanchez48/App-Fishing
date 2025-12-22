import 'package:chat_flutter_supabase/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepositoryFishingEvent {
  RepositoryFishingEvent({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  Future<List<FishingEvent>> getAllEvents() async {
    final response = await _supabase
        .from('fishing_events')
        .select()
        .order('start_date', ascending: true);

    return response.map(FishingEvent.fromJson).toList();
  }

  Future<FishingEvent?> getEventById(String id) async {
    final response = await _supabase
        .from('fishing_events')
        .select()
        .eq('id', id)
        .single();

    return FishingEvent.fromJson(response);
  }

  Future<void> createEvent(FishingEvent event) async {
    await _supabase.from('fishing_events').insert(event.toJson());
  }
}
