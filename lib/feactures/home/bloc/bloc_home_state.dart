part of 'bloc_home.dart';

class BlocHomeState extends Equatable {
  const BlocHomeState._({
    this.users = const [],
    this.events = const [],
  });

  BlocHomeState.from(
    BlocHomeState state, {

    List<Usuario>? users,
    List<FishingEvent>? events,
  }) : this._(
         users: users ?? state.users,
         events: events ?? state.events,
       );

  ///
  final List<Usuario> users;

  ///
  final List<FishingEvent> events;

  @override
  List<Object?> get props => [
    users,
    events,
  ];
}

class BlocHomeStateInitial extends BlocHomeState {
  const BlocHomeStateInitial() : super._();
}

class BlocHomeStateLoading extends BlocHomeState {
  BlocHomeStateLoading.from(super.state) : super.from();
}

class BlocHomeStateSuccess extends BlocHomeState {
  BlocHomeStateSuccess.from(
    super.state, {
    super.users,
    super.events,
  }) : super.from();
}

class BlocHomeStateError extends BlocHomeState {
  BlocHomeStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  ///
  final String errorMessage;
}
