import 'package:bloc/bloc.dart';
import 'package:chat_flutter_supabase/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_dashboard_event.dart';
part 'bloc_dashboard_state.dart';

class BlocDashboard extends Bloc<BlocDashboardEvent, BlocDashboardState> {
  BlocDashboard({required this.supabase})
    : super(const BlocDashboardStateInitial()) {
    on<BlocDashboardEventGetUsers>(_onGetUsers);
    on<BlocDashboardEventLogOut>(_onLogOut);

    add(const BlocDashboardEventGetUsers());
  }

  /// Instancia de supabase
  final SupabaseClient supabase;

  Future<void> _onGetUsers(
    BlocDashboardEventGetUsers event,
    Emitter<BlocDashboardState> emit,
  ) async {
    try {
      emit(BlocDashboardStateLoading.from(state));

      final currentUserId = supabase.auth.currentUser!.id;

      final response = await supabase
          .from('users')
          .select()
          .neq('uuid', currentUserId);

      final users = response.map(Usuario.fromJson).toList();

      emit(BlocDashboardStateSuccess.from(state, users: users));
    } on Exception catch (e, st) {
      emit(BlocDashboardStateError.from(state, errorMessage: '$e $st'));
    }
  }

  Future<void> _onLogOut(
    BlocDashboardEventLogOut event,
    Emitter<BlocDashboardState> emit,
  ) async {
    try {
      emit(BlocDashboardStateLoading.from(state));

      await supabase.auth.signOut();

      emit(BlocDashboardStateSuccess.from(state));
    } on Exception catch (e, st) {
      emit(
        BlocDashboardStateError.from(state, errorMessage: '$e $st'),
      );
    }
  }
}
