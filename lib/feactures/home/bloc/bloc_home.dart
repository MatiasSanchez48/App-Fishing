import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_home_event.dart';
part 'bloc_home_state.dart';

class BlocHomeBloc extends Bloc<BlocHomeEvent, BlocHomeState> {
  BlocHomeBloc() : super(const BlocHomeStateInitial()) {
    on<BlocHomeEvent>((event, emit) {});
  }
}
