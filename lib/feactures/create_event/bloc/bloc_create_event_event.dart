part of 'bloc_create_event.dart';

@immutable
abstract class BlocCreateEventEvent extends Equatable {
  const BlocCreateEventEvent();

  @override
  List<Object> get props => [];
}

class BlocCreateEventCreateNewEvent extends BlocCreateEventEvent {
  const BlocCreateEventCreateNewEvent();
}

class BlocCreateEventSaveEvent extends BlocCreateEventEvent {
  const BlocCreateEventSaveEvent({
    this.updatedAt,
    this.departureTime,
    this.createdAt,
    this.createdBy,
    this.title,
    this.description,
    this.fishingType,
    this.location,
    this.startDate,
    this.endDate,
    this.status,
    this.image,
  });

  ///
  final String? createdBy;

  ///
  final String? title;

  ///
  final String? description;

  ///
  final List<FishingType>? fishingType;

  ///
  final String? location;

  ///
  final DateTime? startDate;

  ///
  final DateTime? endDate;

  ///
  final EventStatus? status;

  ///
  final DateTime? createdAt;

  ///
  final DateTime? updatedAt;

  ///
  final String? departureTime;

  ///
  final XFile? image;
}
