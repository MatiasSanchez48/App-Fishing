import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_comment_model.freezed.dart';
part 'event_comment_model.g.dart';

@freezed
class EventComment with _$EventComment {
  const factory EventComment({
    required int id,
    required int eventId,
    required int userId,
    required String content,
    required DateTime createdAt,
  }) = _EventComment;

  factory EventComment.fromJson(Map<String, dynamic> json) =>
      _$EventCommentFromJson(json);
}
