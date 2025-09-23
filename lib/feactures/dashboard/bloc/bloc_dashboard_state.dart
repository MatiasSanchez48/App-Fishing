part of 'bloc_dashboard.dart';

@immutable
abstract class BlocDashboardState extends Equatable {
  const BlocDashboardState._({
    this.users = const [],
  });

  BlocDashboardState.from(
    BlocDashboardState state, {
    List<Usuario>? users,
  }) : this._(
         users: users ?? state.users,
       );

  final List<Usuario> users;
  @override
  List<Object?> get props => [];
}

class BlocDashboardStateInitial extends BlocDashboardState {
  const BlocDashboardStateInitial() : super._();
}

class BlocDashboardStateSuccess extends BlocDashboardState {
  BlocDashboardStateSuccess.from(super.state, {super.users}) : super.from();
}

class BlocDashboardStateForgotPassword extends BlocDashboardState {
  BlocDashboardStateForgotPassword.from(super.state) : super.from();
}

class BlocDashboardStateLoading extends BlocDashboardState {
  BlocDashboardStateLoading.from(super.state) : super.from();
}

class BlocDashboardStateError extends BlocDashboardState {
  BlocDashboardStateError.from(super.state, {required this.errorMessage})
    : super.from();

  ///
  final String errorMessage;
}
