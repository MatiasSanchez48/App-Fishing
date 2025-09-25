// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventComment _$EventCommentFromJson(Map<String, dynamic> json) {
  return _EventComment.fromJson(json);
}

/// @nodoc
mixin _$EventComment {
  int get id => throw _privateConstructorUsedError;
  int get eventId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this EventComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCommentCopyWith<EventComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCommentCopyWith<$Res> {
  factory $EventCommentCopyWith(
    EventComment value,
    $Res Function(EventComment) then,
  ) = _$EventCommentCopyWithImpl<$Res, EventComment>;
  @useResult
  $Res call({
    int id,
    int eventId,
    int userId,
    String content,
    DateTime createdAt,
  });
}

/// @nodoc
class _$EventCommentCopyWithImpl<$Res, $Val extends EventComment>
    implements $EventCommentCopyWith<$Res> {
  _$EventCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventCommentImplCopyWith<$Res>
    implements $EventCommentCopyWith<$Res> {
  factory _$$EventCommentImplCopyWith(
    _$EventCommentImpl value,
    $Res Function(_$EventCommentImpl) then,
  ) = __$$EventCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int eventId,
    int userId,
    String content,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$EventCommentImplCopyWithImpl<$Res>
    extends _$EventCommentCopyWithImpl<$Res, _$EventCommentImpl>
    implements _$$EventCommentImplCopyWith<$Res> {
  __$$EventCommentImplCopyWithImpl(
    _$EventCommentImpl _value,
    $Res Function(_$EventCommentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$EventCommentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventCommentImpl implements _EventComment {
  const _$EventCommentImpl({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.content,
    required this.createdAt,
  });

  factory _$EventCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCommentImplFromJson(json);

  @override
  final int id;
  @override
  final int eventId;
  @override
  final int userId;
  @override
  final String content;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventComment(id: $id, eventId: $eventId, userId: $userId, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, eventId, userId, content, createdAt);

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCommentImplCopyWith<_$EventCommentImpl> get copyWith =>
      __$$EventCommentImplCopyWithImpl<_$EventCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCommentImplToJson(this);
  }
}

abstract class _EventComment implements EventComment {
  const factory _EventComment({
    required final int id,
    required final int eventId,
    required final int userId,
    required final String content,
    required final DateTime createdAt,
  }) = _$EventCommentImpl;

  factory _EventComment.fromJson(Map<String, dynamic> json) =
      _$EventCommentImpl.fromJson;

  @override
  int get id;
  @override
  int get eventId;
  @override
  int get userId;
  @override
  String get content;
  @override
  DateTime get createdAt;

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCommentImplCopyWith<_$EventCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
