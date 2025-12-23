part of 'bloc_create_event.dart';

@immutable
class BlocCreateEventState extends Equatable {
  const BlocCreateEventState._({
    this.title = '',
    this.location = '',
    this.createdBy = '',
    this.description = '',
    this.departureTime = '',
    this.fishingType = const [],
    this.status = EventStatus.public,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  BlocCreateEventState.from(
    BlocCreateEventState state, {
    String? createdBy,
    String? title,
    String? description,
    List<FishingType>? fishingType,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    EventStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? departureTime,
    XFile? image,
  }) : this._(
         createdBy: createdBy ?? state.createdBy,
         title: title ?? state.title,
         description: description ?? state.description,
         fishingType: fishingType ?? state.fishingType,
         location: location ?? state.location,
         startDate: startDate ?? state.startDate,
         endDate: endDate ?? state.endDate,
         status: status ?? state.status,
         createdAt: createdAt ?? state.createdAt,
         updatedAt: updatedAt ?? state.updatedAt,
         departureTime: departureTime ?? state.departureTime,
         image: image ?? state.image,
       );

  ///
  final String createdBy;

  ///
  final String title;

  ///
  final String description;

  ///
  final List<FishingType> fishingType;

  ///
  final String location;

  ///
  final DateTime? startDate;

  ///
  final DateTime? endDate;

  ///
  final EventStatus status;

  ///
  final DateTime? createdAt;

  ///
  final DateTime? updatedAt;

  ///
  final String departureTime;

  ///
  final XFile? image;

  @override
  List<Object?> get props => [
    createdBy,
    title,
    description,
    fishingType,
    location,
    startDate,
    endDate,
    status,
    createdAt,
    updatedAt,
    departureTime,
    image,
  ];
}

class BlocCreateStateInitial extends BlocCreateEventState {
  const BlocCreateStateInitial() : super._();
}

class BlocCreateStateSuccess extends BlocCreateEventState {
  BlocCreateStateSuccess.from(
    super.state, {
    super.createdBy,
    super.title,
    super.description,
    super.fishingType,
    super.location,
    super.startDate,
    super.endDate,
    super.status,
    super.createdAt,
    super.updatedAt,
    super.departureTime,
    super.image,
  }) : super.from();
}

class BlocCreateStateSuccessCreateEvent extends BlocCreateEventState {
  BlocCreateStateSuccessCreateEvent.from(super.state) : super.from();
}

class BlocCreateStateLoading extends BlocCreateEventState {
  BlocCreateStateLoading.from(super.state) : super.from();
}

class BlocCreateStateError extends BlocCreateEventState {
  BlocCreateStateError.from(super.state, {required this.errorMessage})
    : super.from();

  ///
  final String errorMessage;
}
