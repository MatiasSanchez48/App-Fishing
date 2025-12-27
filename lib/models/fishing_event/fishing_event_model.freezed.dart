// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fishing_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FishingEvent _$FishingEventFromJson(Map<String, dynamic> json) {
  return _FishingEvent.fromJson(json);
}

/// @nodoc
mixin _$FishingEvent {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Ejemplo: ['freshwater', 'saltwater']
  ///  Enum 'FishingType'
  @JsonKey(name: 'fishing_type')
  List<String> get fishingType => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime get endDate => throw _privateConstructorUsedError;

  /// 0: planned, 1: ongoing, 2: completed, 3:
  /// cancelled enum 'EventStatus'
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_time')
  String get departureTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// 👇 relación
  List<EventParticipant> get participants => throw _privateConstructorUsedError;

  /// Serializes this FishingEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FishingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FishingEventCopyWith<FishingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FishingEventCopyWith<$Res> {
  factory $FishingEventCopyWith(
    FishingEvent value,
    $Res Function(FishingEvent) then,
  ) = _$FishingEventCopyWithImpl<$Res, FishingEvent>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'created_by') String createdBy,
    String title,
    String description,
    @JsonKey(name: 'fishing_type') List<String> fishingType,
    String location,
    @JsonKey(name: 'start_date') DateTime startDate,
    @JsonKey(name: 'end_date') DateTime endDate,
    int status,
    @JsonKey(name: 'departure_time') String departureTime,
    @JsonKey(name: 'image_url') String imageUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    List<EventParticipant> participants,
  });
}

/// @nodoc
class _$FishingEventCopyWithImpl<$Res, $Val extends FishingEvent>
    implements $FishingEventCopyWith<$Res> {
  _$FishingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FishingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? title = null,
    Object? description = null,
    Object? fishingType = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? departureTime = null,
    Object? imageUrl = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? participants = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            createdBy: null == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            fishingType: null == fishingType
                ? _value.fishingType
                : fishingType // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as int,
            departureTime: null == departureTime
                ? _value.departureTime
                : departureTime // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            participants: null == participants
                ? _value.participants
                : participants // ignore: cast_nullable_to_non_nullable
                      as List<EventParticipant>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FishingEventImplCopyWith<$Res>
    implements $FishingEventCopyWith<$Res> {
  factory _$$FishingEventImplCopyWith(
    _$FishingEventImpl value,
    $Res Function(_$FishingEventImpl) then,
  ) = __$$FishingEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'created_by') String createdBy,
    String title,
    String description,
    @JsonKey(name: 'fishing_type') List<String> fishingType,
    String location,
    @JsonKey(name: 'start_date') DateTime startDate,
    @JsonKey(name: 'end_date') DateTime endDate,
    int status,
    @JsonKey(name: 'departure_time') String departureTime,
    @JsonKey(name: 'image_url') String imageUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    List<EventParticipant> participants,
  });
}

/// @nodoc
class __$$FishingEventImplCopyWithImpl<$Res>
    extends _$FishingEventCopyWithImpl<$Res, _$FishingEventImpl>
    implements _$$FishingEventImplCopyWith<$Res> {
  __$$FishingEventImplCopyWithImpl(
    _$FishingEventImpl _value,
    $Res Function(_$FishingEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FishingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? title = null,
    Object? description = null,
    Object? fishingType = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? departureTime = null,
    Object? imageUrl = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? participants = null,
  }) {
    return _then(
      _$FishingEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        createdBy: null == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        fishingType: null == fishingType
            ? _value._fishingType
            : fishingType // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as int,
        departureTime: null == departureTime
            ? _value.departureTime
            : departureTime // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        participants: null == participants
            ? _value._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<EventParticipant>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FishingEventImpl implements _FishingEvent {
  const _$FishingEventImpl({
    required this.id,
    @JsonKey(name: 'created_by') required this.createdBy,
    required this.title,
    required this.description,
    @JsonKey(name: 'fishing_type') required final List<String> fishingType,
    required this.location,
    @JsonKey(name: 'start_date') required this.startDate,
    @JsonKey(name: 'end_date') required this.endDate,
    required this.status,
    @JsonKey(name: 'departure_time') required this.departureTime,
    @JsonKey(name: 'image_url') required this.imageUrl,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    final List<EventParticipant> participants = const [],
  }) : _fishingType = fishingType,
       _participants = participants;

  factory _$FishingEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$FishingEventImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_by')
  final String createdBy;
  @override
  final String title;
  @override
  final String description;

  /// Ejemplo: ['freshwater', 'saltwater']
  ///  Enum 'FishingType'
  final List<String> _fishingType;

  /// Ejemplo: ['freshwater', 'saltwater']
  ///  Enum 'FishingType'
  @override
  @JsonKey(name: 'fishing_type')
  List<String> get fishingType {
    if (_fishingType is EqualUnmodifiableListView) return _fishingType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fishingType);
  }

  @override
  final String location;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime endDate;

  /// 0: planned, 1: ongoing, 2: completed, 3:
  /// cancelled enum 'EventStatus'
  @override
  final int status;
  @override
  @JsonKey(name: 'departure_time')
  final String departureTime;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  /// 👇 relación
  final List<EventParticipant> _participants;

  /// 👇 relación
  @override
  @JsonKey()
  List<EventParticipant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'FishingEvent(id: $id, createdBy: $createdBy, title: $title, description: $description, fishingType: $fishingType, location: $location, startDate: $startDate, endDate: $endDate, status: $status, departureTime: $departureTime, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FishingEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._fishingType,
              _fishingType,
            ) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdBy,
    title,
    description,
    const DeepCollectionEquality().hash(_fishingType),
    location,
    startDate,
    endDate,
    status,
    departureTime,
    imageUrl,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_participants),
  );

  /// Create a copy of FishingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FishingEventImplCopyWith<_$FishingEventImpl> get copyWith =>
      __$$FishingEventImplCopyWithImpl<_$FishingEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FishingEventImplToJson(this);
  }
}

abstract class _FishingEvent implements FishingEvent {
  const factory _FishingEvent({
    required final int id,
    @JsonKey(name: 'created_by') required final String createdBy,
    required final String title,
    required final String description,
    @JsonKey(name: 'fishing_type') required final List<String> fishingType,
    required final String location,
    @JsonKey(name: 'start_date') required final DateTime startDate,
    @JsonKey(name: 'end_date') required final DateTime endDate,
    required final int status,
    @JsonKey(name: 'departure_time') required final String departureTime,
    @JsonKey(name: 'image_url') required final String imageUrl,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final List<EventParticipant> participants,
  }) = _$FishingEventImpl;

  factory _FishingEvent.fromJson(Map<String, dynamic> json) =
      _$FishingEventImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_by')
  String get createdBy;
  @override
  String get title;
  @override
  String get description;

  /// Ejemplo: ['freshwater', 'saltwater']
  ///  Enum 'FishingType'
  @override
  @JsonKey(name: 'fishing_type')
  List<String> get fishingType;
  @override
  String get location;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime get endDate;

  /// 0: planned, 1: ongoing, 2: completed, 3:
  /// cancelled enum 'EventStatus'
  @override
  int get status;
  @override
  @JsonKey(name: 'departure_time')
  String get departureTime;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// 👇 relación
  @override
  List<EventParticipant> get participants;

  /// Create a copy of FishingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FishingEventImplCopyWith<_$FishingEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
