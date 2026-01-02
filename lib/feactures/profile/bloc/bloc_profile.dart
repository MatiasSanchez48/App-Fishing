import 'package:bloc/bloc.dart';
import 'package:chat_flutter_supabase/models/models.dart';
import 'package:chat_flutter_supabase/repository/repository.dart';
import 'package:chat_flutter_supabase/repository/repository_user.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_profile_event.dart';
part 'bloc_profile_state.dart';

class BlocProfile extends Bloc<BlocProfileEvent, BlocProfileState> {
  BlocProfile({required this.supabase})
    : super(const BlocProfileStateInitial()) {
    on<BlocProfileEventGetProfile>(_onGetProfile);
    on<BlocProfileEventGetMyEvents>(_onGetMyEvents);

    on<BlocProfileEventEditProfile>(_onEditProfile);
    on<BlocProfileEventSaveDataProfile>(_onSaveDataProfile);
  }

  ///
  final SupabaseClient supabase;

  ///
  late final _repositoryUser = RepositoryUser(supabase: supabase);

  ///
  late final _repositoryImage = RepositoryImages(supabase: supabase);

  ///
  late final _repositoryFishingEvent = RepositoryFishingEvent(
    supabase: supabase,
  );

  Future<void> _onGetProfile(
    BlocProfileEventGetProfile event,
    Emitter<BlocProfileState> emit,
  ) async {
    try {
      emit(BlocProfileStateLoading.from(state));

      final user = await _repositoryUser.getUserById(event.id);

      emit(BlocProfileStateSuccess.from(state, user: user));
    } on Exception catch (e) {
      emit(
        BlocProfileStateError.from(
          state,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onGetMyEvents(
    BlocProfileEventGetMyEvents event,
    Emitter<BlocProfileState> emit,
  ) async {
    try {
      emit(BlocProfileStateLoadingEvents.from(state));

      final eventsCreated = await _repositoryFishingEvent
          .getEventsCreatedByUser(event.id);
      final eventsUnited = await _repositoryFishingEvent
          .getEventsWhereUserJoined(event.id);

      emit(
        BlocProfileStateSuccess.from(
          state,
          eventsCreated: eventsCreated,
          eventsUnited: eventsUnited,
        ),
      );
    } on Exception catch (e) {
      emit(
        BlocProfileStateError.from(
          state,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onSaveDataProfile(
    BlocProfileEventSaveDataProfile event,
    Emitter<BlocProfileState> emit,
  ) async => emit(
    BlocProfileStateSuccess.from(
      state,
      name: event.name ?? state.name,
      description: event.description ?? state.description,
      imageUrl: event.imageUrl ?? state.imageUrl,
      handle: event.handle ?? state.handle,
      user: state.user?.copyWith(
        username: event.name ?? state.name ?? state.user?.username ?? '',
        description: event.description ?? state.description,
        handle: event.handle ?? state.handle,
      ),
    ),
  );

  Future<void> _onEditProfile(
    BlocProfileEventEditProfile event,
    Emitter<BlocProfileState> emit,
  ) async {
    try {
      emit(BlocProfileStateLoading.from(state));
      // get user
      String? imageUrl;
      if (state.imageUrl != null) {
        imageUrl = await _repositoryImage.createImage(
          state.imageUrl!,
        );
      }
      final user = await _repositoryUser.updateUser(
        uuid: state.user?.uuid ?? '',
        username: state.name ?? state.user?.username ?? '',
        description: state.description ?? state.user?.description ?? '',
        avatarUrl: imageUrl ?? state.user?.avatarUrl ?? '',
        handle: state.handle ?? state.user?.handle ?? '',
      );

      emit(BlocProfileStateSuccess.from(state, user: user));
    } on Exception catch (e) {
      emit(
        BlocProfileStateError.from(
          state,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
