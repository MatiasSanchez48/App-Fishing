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
  String get createdBy => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<FishingType> get fishingType => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  EventStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

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
    String createdBy,
    String imageUrl,
    String title,
    String description,
    List<FishingType> fishingType,
    String location,
    DateTime startDate,
    DateTime endDate,
    EventStatus status,
    DateTime createdAt,
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
    Object? imageUrl = null,
    Object? title = null,
    Object? description = null,
    Object? fishingType = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? createdAt = null,
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
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
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
                      as List<FishingType>,
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
                      as EventStatus,
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
    String createdBy,
    String imageUrl,
    String title,
    String description,
    List<FishingType> fishingType,
    String location,
    DateTime startDate,
    DateTime endDate,
    EventStatus status,
    DateTime createdAt,
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
    Object? imageUrl = null,
    Object? title = null,
    Object? description = null,
    Object? fishingType = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? createdAt = null,
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
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
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
                  as List<FishingType>,
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
                  as EventStatus,
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
class _$FishingEventImpl implements _FishingEvent {
  const _$FishingEventImpl({
    required this.id,
    required this.createdBy,
    required this.imageUrl,
    required this.title,
    required this.description,
    required final List<FishingType> fishingType,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdAt,
  }) : _fishingType = fishingType;

  factory _$FishingEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$FishingEventImplFromJson(json);

  @override
  final int id;
  @override
  final String createdBy;
  @override
  final String imageUrl;
  @override
  final String title;
  @override
  final String description;
  final List<FishingType> _fishingType;
  @override
  List<FishingType> get fishingType {
    if (_fishingType is EqualUnmodifiableListView) return _fishingType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fishingType);
  }

  @override
  final String location;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final EventStatus status;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'FishingEvent(id: $id, createdBy: $createdBy, imageUrl: $imageUrl, title: $title, description: $description, fishingType: $fishingType, location: $location, startDate: $startDate, endDate: $endDate, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FishingEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
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
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdBy,
    imageUrl,
    title,
    description,
    const DeepCollectionEquality().hash(_fishingType),
    location,
    startDate,
    endDate,
    status,
    createdAt,
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
    required final String createdBy,
    required final String imageUrl,
    required final String title,
    required final String description,
    required final List<FishingType> fishingType,
    required final String location,
    required final DateTime startDate,
    required final DateTime endDate,
    required final EventStatus status,
    required final DateTime createdAt,
  }) = _$FishingEventImpl;

  factory _FishingEvent.fromJson(Map<String, dynamic> json) =
      _$FishingEventImpl.fromJson;

  @override
  int get id;
  @override
  String get createdBy;
  @override
  String get imageUrl;
  @override
  String get title;
  @override
  String get description;
  @override
  List<FishingType> get fishingType;
  @override
  String get location;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  EventStatus get status;
  @override
  DateTime get createdAt;

  /// Create a copy of FishingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FishingEventImplCopyWith<_$FishingEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
