import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_social_event.dart';
part 'bloc_social_state.dart';

class BlocSocial extends Bloc<BlocSocialEvent, BlocSocialState> {
  BlocSocial() : super(const BlocSocialStateInitial()) {
    on<BlocSocialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
