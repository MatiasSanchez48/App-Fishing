part of 'bloc_home.dart';

@immutable
abstract class BlocHomeEvent extends Equatable {
  const BlocHomeEvent();

  @override
  List<Object> get props => [];
}

class BlocHomeEventGetUsers extends BlocHomeEvent {
  const BlocHomeEventGetUsers();
}

class BlocHomeEventLogOut extends BlocHomeEvent {
  const BlocHomeEventLogOut();
}
