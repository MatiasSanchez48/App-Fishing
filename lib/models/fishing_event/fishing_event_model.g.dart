// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fishing_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FishingEventImpl _$$FishingEventImplFromJson(Map<String, dynamic> json) =>
    _$FishingEventImpl(
      id: (json['id'] as num).toInt(),
      createdBy: json['createdBy'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      fishingType: (json['fishingType'] as List<dynamic>)
          .map((e) => $enumDecode(_$FishingTypeEnumMap, e))
          .toList(),
      location: json['location'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: $enumDecode(_$EventStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FishingEventImplToJson(_$FishingEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'description': instance.description,
      'fishingType': instance.fishingType
          .map((e) => _$FishingTypeEnumMap[e]!)
          .toList(),
      'location': instance.location,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'status': _$EventStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$FishingTypeEnumMap = {
  FishingType.surubi: 'surubi',
  FishingType.bagre: 'bagre',
  FishingType.dorado: 'dorado',
  FishingType.tararira: 'tararira',
  FishingType.pejerrey: 'pejerrey',
  FishingType.trucha: 'trucha',
  FishingType.pacu: 'pacu',
  FishingType.boga: 'boga',
  FishingType.otro: 'otro',
};

const _$EventStatusEnumMap = {
  EventStatus.public: 'public',
  EventStatus.private: 'private',
};
