part of 'bloc_profile.dart';

class BlocProfileEvent extends Equatable {
  const BlocProfileEvent();

  @override
  List<Object> get props => [];
}

class BlocProfileEventGetProfile extends BlocProfileEvent {
  const BlocProfileEventGetProfile({required this.id});

  ///
  final String id;
}

class BlocProfileEventGetMyEvents extends BlocProfileEvent {
  const BlocProfileEventGetMyEvents({required this.id});

  ///
  final String id;
}

class BlocProfileEventSaveDataProfile extends BlocProfileEvent {
  const BlocProfileEventSaveDataProfile({
    this.id,
    this.name,
    this.handle,
    this.imageXFile,
    this.description,
  });

  ///
  final String? id;

  ///
  final String? name;

  ///
  final String? description;

  ///
  final String? handle;

  ///
  final XFile? imageXFile;
}

class BlocProfileEventEditProfile extends BlocProfileEvent {
  const BlocProfileEventEditProfile();
}
