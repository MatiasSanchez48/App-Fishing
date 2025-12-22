import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_dashboard_event.dart';
part 'bloc_dashboard_state.dart';

class BlocDashboard extends Bloc<BlocDashboardEvent, BlocDashboardState> {
  BlocDashboard() : super(const BlocDashboardStateInitial());
}
