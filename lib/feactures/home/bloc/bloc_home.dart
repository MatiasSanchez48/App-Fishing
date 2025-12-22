import 'package:bloc/bloc.dart';
import 'package:chat_flutter_supabase/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_home_event.dart';
part 'bloc_home_state.dart';

class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  BlocHome({required this.supabase}) : super(const BlocHomeStateInitial()) {
    on<BlocHomeEventGetUsers>(_onGetUsers);
    on<BlocHomeEventLogOut>(_onLogOut);

    add(const BlocHomeEventGetUsers());
  }

  /// Instancia de supabase
  final SupabaseClient supabase;

  Future<void> _onGetUsers(
    BlocHomeEventGetUsers event,
    Emitter<BlocHomeState> emit,
  ) async {
    try {
      emit(BlocHomeStateLoading.from(state));

      final currentUserId = supabase.auth.currentUser!.id;

      final response = await supabase
          .from('users')
          .select()
          .neq('uuid', currentUserId);

      final users = response.map(Usuario.fromJson).toList();

      emit(BlocHomeStateSuccess.from(state, users: users));
    } on Exception catch (e, st) {
      emit(BlocHomeStateError.from(state, errorMessage: '$e $st'));
    }
  }

  Future<void> _onLogOut(
    BlocHomeEventLogOut event,
    Emitter<BlocHomeState> emit,
  ) async {
    try {
      emit(BlocHomeStateLoading.from(state));

      await supabase.auth.signOut();

      emit(BlocHomeStateSuccess.from(state));
    } on Exception catch (e, st) {
      emit(
        BlocHomeStateError.from(state, errorMessage: '$e $st'),
      );
    }
  }
}
