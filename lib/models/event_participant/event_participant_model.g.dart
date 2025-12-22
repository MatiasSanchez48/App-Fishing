// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventParticipantImpl _$$EventParticipantImplFromJson(
  Map<String, dynamic> json,
) => _$EventParticipantImpl(
  id: (json['id'] as num).toInt(),
  eventId: (json['eventId'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  joinedAt: DateTime.parse(json['joinedAt'] as String),
);

Map<String, dynamic> _$$EventParticipantImplToJson(
  _$EventParticipantImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'eventId': instance.eventId,
  'userId': instance.userId,
  'joinedAt': instance.joinedAt.toIso8601String(),
};
