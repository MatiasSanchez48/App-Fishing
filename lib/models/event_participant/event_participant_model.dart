import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_participant_model.freezed.dart';
part 'event_participant_model.g.dart';

@freezed
class EventParticipant with _$EventParticipant {
  const factory EventParticipant({
    required int id,
    required int eventId,
    required int userId,
    required DateTime joinedAt,
  }) = _EventParticipant;

  factory EventParticipant.fromJson(Map<String, dynamic> json) =>
      _$EventParticipantFromJson(json);
}
