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
  final String id;
}
