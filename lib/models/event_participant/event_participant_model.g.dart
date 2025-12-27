// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventParticipantImpl _$$EventParticipantImplFromJson(
  Map<String, dynamic> json,
) => _$EventParticipantImpl(
  id: (json['id'] as num).toInt(),
  eventId: (json['event_id'] as num).toInt(),
  userId: json['user_id'] as String,
  joinedAt: DateTime.parse(json['joined_at'] as String),
  profiles: json['profiles'] == null
      ? null
      : Usuario.fromJson(json['profiles'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$EventParticipantImplToJson(
  _$EventParticipantImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'event_id': instance.eventId,
  'user_id': instance.userId,
  'joined_at': instance.joinedAt.toIso8601String(),
  'profiles': instance.profiles,
};
