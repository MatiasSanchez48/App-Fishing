part of 'details_event.dart';

@immutable
class BlocDetailsEventEvent extends Equatable {
  const BlocDetailsEventEvent();

  @override
  List<Object> get props => [];
}

class BlocDetailsEventGetEvent extends BlocDetailsEventEvent {
  const BlocDetailsEventGetEvent({required this.id});

  ///
  final int id;
}

class BlocDetailsEventEnterEvent extends BlocDetailsEventEvent {
  const BlocDetailsEventEnterEvent();
}

class BlocDetailsEventDeleteEvent extends BlocDetailsEventEvent {
  const BlocDetailsEventDeleteEvent();
}

class BlocDetailsEventLeaveEvent extends BlocDetailsEventEvent {
  const BlocDetailsEventLeaveEvent();
}
