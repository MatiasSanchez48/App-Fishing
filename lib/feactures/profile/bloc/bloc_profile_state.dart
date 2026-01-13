part of 'bloc_profile.dart';

class BlocProfileState extends Equatable {
  const BlocProfileState._({
    this.user,
    this.eventsCreated = const <FishingEvent>[],
    this.eventsUnited = const <FishingEvent>[],
    this.name,
    this.description,
    this.handle,
    this.imageXFile,
    this.imageUrl = '',
  });

  BlocProfileState.from(
    BlocProfileState state, {
    Usuario? user,
    List<FishingEvent>? eventsCreated,
    List<FishingEvent>? eventsUnited,
    String? name,
    String? description,
    String? handle,
    XFile? imageXFile,
    String? imageUrl,
  }) : this._(
         user: user ?? state.user,
         eventsCreated: eventsCreated ?? state.eventsCreated,
         eventsUnited: eventsUnited ?? state.eventsUnited,
         name: name ?? state.name,
         description: description ?? state.description,
         handle: handle ?? state.handle,
         imageXFile: imageXFile ?? state.imageXFile,
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
  final XFile? imageXFile;

  final String imageUrl;

  ///
  bool get isNotEmpty =>
      (name != null && name!.isNotEmpty) ||
      (description != null && description!.isNotEmpty) ||
      (handle != null && handle!.isNotEmpty) ||
      (imageXFile != null && imageXFile!.path.isNotEmpty);

  @override
  List<Object?> get props => [
    user,
    eventsCreated,
    eventsUnited,
    name,
    description,
    handle,
    imageXFile,
    imageUrl,
  ];
}

class BlocProfileStateInitial extends BlocProfileState {
  const BlocProfileStateInitial() : super._();
}

class BlocProfileStateLoading extends BlocProfileState {
  BlocProfileStateLoading.from(super.state) : super.from();
}

class BlocProfileStateLoadingEditProfile extends BlocProfileState {
  BlocProfileStateLoadingEditProfile.from(super.state) : super.from();
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
    super.imageXFile,
  }) : super.from();
}

class BlocProfileStateSuccessEditProfile extends BlocProfileState {
  BlocProfileStateSuccessEditProfile.from(
    super.state, {
    super.user,
    super.eventsCreated,
    super.eventsUnited,
    super.name,
    super.description,
    super.handle,
    super.imageXFile,
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
