part of 'bloc_message.dart';

abstract class BlocMessageEvent extends Equatable {
  const BlocMessageEvent();

  @override
  List<Object?> get props => [];
}

class BlocMessageHearMessagesEvent extends BlocMessageEvent {
  const BlocMessageHearMessagesEvent({
    required this.idPerson,
  });

  ///
  final String idPerson;
}

class BlocMessageGetMessagesEvent extends BlocMessageEvent {
  const BlocMessageGetMessagesEvent({
    required this.idPerson,
  });

  ///
  final String idPerson;
}

class BlocMessageSendMessagesEvent extends BlocMessageEvent {
  const BlocMessageSendMessagesEvent({
    required this.text,
    required this.idPerson,
  });

  ///
  final String text;

  ///
  final String idPerson;
}
