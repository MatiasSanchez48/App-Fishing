// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventCommentImpl _$$EventCommentImplFromJson(Map<String, dynamic> json) =>
    _$EventCommentImpl(
      id: (json['id'] as num).toInt(),
      eventId: (json['eventId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$EventCommentImplToJson(_$EventCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'userId': instance.userId,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
    };
