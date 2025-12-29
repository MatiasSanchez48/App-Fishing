// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fishing_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FishingEventImpl _$$FishingEventImplFromJson(Map<String, dynamic> json) =>
    _$FishingEventImpl(
      id: (json['id'] as num).toInt(),
      createdBy: json['created_by'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      fishingType:
          (json['fishing_type'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      location: json['location'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      status: (json['status'] as num).toInt(),
      departureTime: json['departure_time'] as String,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map((e) => EventParticipant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FishingEventImplToJson(_$FishingEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'title': instance.title,
      'description': instance.description,
      'fishing_type': instance.fishingType,
      'location': instance.location,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'status': instance.status,
      'departure_time': instance.departureTime,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'participants': instance.participants,
    };
