part of 'details_event.dart';

@immutable
abstract class BlocDetailsEventState extends Equatable {
  const BlocDetailsEventState._({
    this.event,
  });

  BlocDetailsEventState.from(
    BlocDetailsEventState state, {
    FishingEvent? event,
  }) : this._(
         event: event ?? state.event,
       );

  ///
  final FishingEvent? event;

  @override
  List<Object?> get props => [
    event,
  ];
}

class BlocDetailsEventStateInitial extends BlocDetailsEventState {
  const BlocDetailsEventStateInitial() : super._();
}

class BlocDetailsEventStateSuccess extends BlocDetailsEventState {
  BlocDetailsEventStateSuccess.from(super.state, {super.event}) : super.from();
}

class BlocDetailsEventStateSuccessDeleteEvent extends BlocDetailsEventState {
  BlocDetailsEventStateSuccessDeleteEvent.from(super.state, {super.event})
    : super.from();
}

class BlocDetailsEventStateSuccessJoinEvent extends BlocDetailsEventState {
  BlocDetailsEventStateSuccessJoinEvent.from(super.state, {super.event})
    : super.from();
}

class BlocDetailsEventStateSuccessLeaveEvent extends BlocDetailsEventState {
  BlocDetailsEventStateSuccessLeaveEvent.from(super.state, {super.event})
    : super.from();
}

class BlocDetailsEventStateLoading extends BlocDetailsEventState {
  BlocDetailsEventStateLoading.from(super.state) : super.from();
}
class BlocDetailsEventStateLoadingInitial extends BlocDetailsEventState {
  BlocDetailsEventStateLoadingInitial.from(super.state) : super.from();
}

class BlocDetailsEventStateError extends BlocDetailsEventState {
  BlocDetailsEventStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  ///
  final String errorMessage;
}
