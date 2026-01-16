import 'package:app_fishing/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_participant_model.freezed.dart';
part 'event_participant_model.g.dart';

@freezed
class EventParticipant with _$EventParticipant {
  const factory EventParticipant({
    required int id,
    @JsonKey(name: 'event_id') required int eventId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'joined_at') required DateTime joinedAt,

    /// 👇 relación
    Usuario? users,
  }) = _EventParticipant;

  factory EventParticipant.fromJson(Map<String, dynamic> json) =>
      _$EventParticipantFromJson(json);
}
