import 'package:freezed_annotation/freezed_annotation.dart';

part 'fishing_event_model.freezed.dart';
part 'fishing_event_model.g.dart';

@freezed
class FishingEvent with _$FishingEvent {
  const factory FishingEvent({
    required int id,
    @JsonKey(name: 'created_by') required String createdBy,
    required String title,
    required String description,

    /// Ejemplo: ['freshwater', 'saltwater']
    ///  Enum 'FishingType'
    @JsonKey(name: 'fishing_type') required List<String> fishingType,

    required String location,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,

    /// 0: planned, 1: ongoing, 2: completed, 3:
    /// cancelled enum 'EventStatus'
    required int status,
    @JsonKey(name: 'departure_time') required String departureTime,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _FishingEvent;

  factory FishingEvent.fromJson(Map<String, dynamic> json) =>
      _$FishingEventFromJson(json);
}
