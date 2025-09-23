part of 'bloc_message.dart';

@immutable
abstract class BlocMessageState extends Equatable {
  const BlocMessageState._({
    this.messages = const [],
  });

  BlocMessageState.from(
    BlocMessageState state, {
    List<Message>? messages,
  }) : this._(messages: messages ?? state.messages);

  ///
  final List<Message> messages;

  @override
  List<Object?> get props => [];
}

class BlocMessageStateInitial extends BlocMessageState {
  const BlocMessageStateInitial() : super._();
}

class BlocMessageStateSuccess extends BlocMessageState {
  BlocMessageStateSuccess.from(super.state, {super.messages}) : super.from();
}

class BlocMessageStateForgotPassword extends BlocMessageState {
  BlocMessageStateForgotPassword.from(super.state) : super.from();
}

class BlocMessageStateLoading extends BlocMessageState {
  BlocMessageStateLoading.from(super.state) : super.from();
}

class BlocMessageStateError extends BlocMessageState {
  BlocMessageStateError.from(super.state, {required this.errorMessage})
    : super.from();

  ///
  final String errorMessage;
}
