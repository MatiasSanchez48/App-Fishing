import 'package:chat_flutter_supabase/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fishing_event_model.freezed.dart';
part 'fishing_event_model.g.dart';

@freezed
class FishingEvent with _$FishingEvent {
  const factory FishingEvent({
    required int id,
    required String createdBy, // user_id del creador
    required String title,
    required String description,
    required List<FishingType> fishingType, // bagre, surubí, etc.
    required String location,
    required DateTime startDate,
    required DateTime endDate,
    required EventStatus status,
    required DateTime createdAt,
  }) = _FishingEvent;

  factory FishingEvent.fromJson(Map<String, dynamic> json) =>
      _$FishingEventFromJson(json);
}
