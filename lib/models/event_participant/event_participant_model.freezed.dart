// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_participant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventParticipant _$EventParticipantFromJson(Map<String, dynamic> json) {
  return _EventParticipant.fromJson(json);
}

/// @nodoc
mixin _$EventParticipant {
  int get id => throw _privateConstructorUsedError;
  int get eventId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  DateTime get joinedAt => throw _privateConstructorUsedError;

  /// Serializes this EventParticipant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventParticipantCopyWith<EventParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventParticipantCopyWith<$Res> {
  factory $EventParticipantCopyWith(
    EventParticipant value,
    $Res Function(EventParticipant) then,
  ) = _$EventParticipantCopyWithImpl<$Res, EventParticipant>;
  @useResult
  $Res call({int id, int eventId, int userId, DateTime joinedAt});
}

/// @nodoc
class _$EventParticipantCopyWithImpl<$Res, $Val extends EventParticipant>
    implements $EventParticipantCopyWith<$Res> {
  _$EventParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? joinedAt = null,
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
            joinedAt: null == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventParticipantImplCopyWith<$Res>
    implements $EventParticipantCopyWith<$Res> {
  factory _$$EventParticipantImplCopyWith(
    _$EventParticipantImpl value,
    $Res Function(_$EventParticipantImpl) then,
  ) = __$$EventParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int eventId, int userId, DateTime joinedAt});
}

/// @nodoc
class __$$EventParticipantImplCopyWithImpl<$Res>
    extends _$EventParticipantCopyWithImpl<$Res, _$EventParticipantImpl>
    implements _$$EventParticipantImplCopyWith<$Res> {
  __$$EventParticipantImplCopyWithImpl(
    _$EventParticipantImpl _value,
    $Res Function(_$EventParticipantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? joinedAt = null,
  }) {
    return _then(
      _$EventParticipantImpl(
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
        joinedAt: null == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventParticipantImpl implements _EventParticipant {
  const _$EventParticipantImpl({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.joinedAt,
  });

  factory _$EventParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventParticipantImplFromJson(json);

  @override
  final int id;
  @override
  final int eventId;
  @override
  final int userId;
  @override
  final DateTime joinedAt;

  @override
  String toString() {
    return 'EventParticipant(id: $id, eventId: $eventId, userId: $userId, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventParticipantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, eventId, userId, joinedAt);

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventParticipantImplCopyWith<_$EventParticipantImpl> get copyWith =>
      __$$EventParticipantImplCopyWithImpl<_$EventParticipantImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EventParticipantImplToJson(this);
  }
}

abstract class _EventParticipant implements EventParticipant {
  const factory _EventParticipant({
    required final int id,
    required final int eventId,
    required final int userId,
    required final DateTime joinedAt,
  }) = _$EventParticipantImpl;

  factory _EventParticipant.fromJson(Map<String, dynamic> json) =
      _$EventParticipantImpl.fromJson;

  @override
  int get id;
  @override
  int get eventId;
  @override
  int get userId;
  @override
  DateTime get joinedAt;

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventParticipantImplCopyWith<_$EventParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
