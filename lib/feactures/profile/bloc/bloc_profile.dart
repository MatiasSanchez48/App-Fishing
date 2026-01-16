import 'package:bloc/bloc.dart';
import 'package:app_fishing/models/models.dart';
import 'package:app_fishing/repository/repository.dart';
import 'package:app_fishing/repository/repository_user.dart';
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
      imageXFile: event.imageXFile ?? state.imageXFile,
      handle: event.handle ?? state.handle,
      user: state.user?.copyWith(
        username: event.name ?? state.name ?? state.user?.username ?? '',
        description:
            event.description ??
            state.description ??
            state.user?.description ??
            '',
        handle: event.handle ?? state.handle ?? state.user?.handle ?? '',
      ),
    ),
  );

  Future<void> _onEditProfile(
    BlocProfileEventEditProfile event,
    Emitter<BlocProfileState> emit,
  ) async {
    try {
      emit(BlocProfileStateLoadingEditProfile.from(state));

      String? imageUrl;

      if (state.imageXFile != null && state.imageUrl != state.user?.avatarUrl) {
        imageUrl = await _repositoryImage.createImage(
          state.imageXFile!,
        );
      }
      final user = await _repositoryUser.updateUser(
        uuid: state.user?.uuid ?? '',
        username: state.name ?? state.user?.username ?? '',
        description: state.description ?? state.user?.description ?? '',
        avatarUrl: imageUrl ?? state.user?.avatarUrl ?? '',
        handle: state.handle ?? state.user?.handle ?? '',
      );

      emit(
        BlocProfileStateSuccessEditProfile.from(
          state,
          user: user,
          imageUrl: imageUrl ?? '',
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
}
