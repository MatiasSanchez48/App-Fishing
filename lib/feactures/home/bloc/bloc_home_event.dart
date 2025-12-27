part of 'bloc_home.dart';

class BlocHomeEvent extends Equatable {
  const BlocHomeEvent();

  @override
  List<Object> get props => [];
}

class BlocHomeEventGetUsers extends BlocHomeEvent {
  const BlocHomeEventGetUsers();
}

class BlocHomeEventGetEvents extends BlocHomeEvent {
  const BlocHomeEventGetEvents();
}

class BlocHomeEventLogOut extends BlocHomeEvent {
  const BlocHomeEventLogOut();
}
