part of 'bloc_dashboard.dart';

@immutable
abstract class BlocDashboardEvent extends Equatable {
  const BlocDashboardEvent();

  @override
  List<Object> get props => [];
}

class BlocDashboardEventGetUsers extends BlocDashboardEvent {
  const BlocDashboardEventGetUsers();
}

class BlocDashboardEventLogOut extends BlocDashboardEvent {
  const BlocDashboardEventLogOut();
}
