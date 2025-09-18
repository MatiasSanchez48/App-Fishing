part of 'bloc_home.dart';

@immutable
abstract class BlocHomeState extends Equatable {
  const BlocHomeState._({
    this.users = const [],
  });

  BlocHomeState.from(
    BlocHomeState state, {
    List<Usuario>? users,
  }) : this._(
         users: users ?? state.users,
       );

  final List<Usuario> users;
  @override
  List<Object?> get props => [];
}

class BlocHomeStateInitial extends BlocHomeState {
  const BlocHomeStateInitial() : super._();
}

class BlocHomeStateSuccess extends BlocHomeState {
  BlocHomeStateSuccess.from(super.state, {super.users}) : super.from();
}

class BlocHomeStateForgotPassword extends BlocHomeState {
  BlocHomeStateForgotPassword.from(super.state) : super.from();
}

class BlocHomeStateLoading extends BlocHomeState {
  BlocHomeStateLoading.from(super.state) : super.from();
}

class BlocHomeStateError extends BlocHomeState {
  BlocHomeStateError.from(super.state, {required this.errorMessage})
    : super.from();

  ///
  final String errorMessage;
}
