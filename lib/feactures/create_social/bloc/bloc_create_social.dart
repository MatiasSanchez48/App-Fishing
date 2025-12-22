import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_create_social_event.dart';
part 'bloc_create_social_state.dart';

class BlocCreateSocialBloc
    extends Bloc<BlocCreateSocialEvent, BlocCreateSocialState> {
  BlocCreateSocialBloc() : super(const BlocCreateSocialStateInitial()) {
    on<BlocCreateSocialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
