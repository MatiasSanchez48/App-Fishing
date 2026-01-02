part of 'bloc_profile.dart';

class BlocProfileState extends Equatable {
  const BlocProfileState._({
    this.user,
    this.eventsCreated = const <FishingEvent>[],
    this.eventsUnited = const <FishingEvent>[],
    this.name,
    this.description,
    this.handle,
    this.imageUrl,
  });

  BlocProfileState.from(
    BlocProfileState state, {
    Usuario? user,
    List<FishingEvent>? eventsCreated,
    List<FishingEvent>? eventsUnited,
    String? name,
    String? description,
    String? handle,
    XFile? imageUrl,
  }) : this._(
         user: user ?? state.user,
         eventsCreated: eventsCreated ?? state.eventsCreated,
         eventsUnited: eventsUnited ?? state.eventsUnited,
         name: name ?? state.name,
         description: description ?? state.description,
         handle: handle ?? state.handle,
         imageUrl: imageUrl ?? state.imageUrl,
       );

  ///
  final Usuario? user;

  ///
  final List<FishingEvent> eventsCreated;

  ///
  final List<FishingEvent> eventsUnited;

  ///
  final String? name;

  ///
  final String? description;

  ///
  final String? handle;

  ///
  final XFile? imageUrl;

  @override
  List<Object?> get props => [
    user,
    eventsCreated,
    eventsUnited,
    name,
    description,
    handle,
    imageUrl,
  ];
}

class BlocProfileStateInitial extends BlocProfileState {
  const BlocProfileStateInitial() : super._();
}

class BlocProfileStateLoading extends BlocProfileState {
  BlocProfileStateLoading.from(super.state) : super.from();
}

class BlocProfileStateLoadingEvents extends BlocProfileState {
  BlocProfileStateLoadingEvents.from(super.state) : super.from();
}

class BlocProfileStateSuccess extends BlocProfileState {
  BlocProfileStateSuccess.from(
    super.state, {
    super.user,
    super.eventsCreated,
    super.eventsUnited,
    super.name,
    super.description,
    super.handle,
    super.imageUrl,
  }) : super.from();
}

class BlocProfileStateError extends BlocProfileState {
  BlocProfileStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  final String errorMessage;
}
