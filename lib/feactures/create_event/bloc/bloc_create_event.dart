import 'package:bloc/bloc.dart';
import 'package:app_fishing/extensions/extensions.dart';
import 'package:app_fishing/models/models.dart';
import 'package:app_fishing/repository/repository.dart';
import 'package:app_fishing/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_create_event_event.dart';
part 'bloc_create_event_state.dart';

class BlocCreateEvent extends Bloc<BlocCreateEventEvent, BlocCreateEventState> {
  BlocCreateEvent({required this.supabase})
    : super(const BlocCreateStateInitial()) {
    on<BlocCreateEventCreateNewEvent>(_createEvent);
    on<BlocCreateEventSaveEvent>(_saveEvent);
  }

  /// Instancia de supabase
  final SupabaseClient supabase;

  ///
  late final RepositoryFishingEvent _repositoryFishingEvent =
      RepositoryFishingEvent(
        supabase: supabase,
      );

  ///
  late final RepositoryImages _repositoryImages = RepositoryImages(
    supabase: supabase,
  );

  ///
  Future<void> _saveEvent(
    BlocCreateEventSaveEvent event,
    Emitter<BlocCreateEventState> emit,
  ) async {
    emit(
      BlocCreateStateSuccess.from(
        state,
        title: event.title ?? state.title,
        createdBy: event.createdBy ?? '',
        status: event.status ?? state.status,
        createdAt: event.createdAt ?? state.createdAt,
        updatedAt: event.updatedAt ?? state.updatedAt,
        description: event.description ?? state.description,
        fishingType: event.fishingType ?? state.fishingType,
        location: event.location ?? state.location,
        startDate: event.startDate ?? state.startDate,
        endDate: event.endDate ?? state.endDate,
        departureTime: event.departureTime ?? state.departureTime,
        image: event.image ?? state.image,
      ),
    );
  }

  ///
  Future<void> _createEvent(
    BlocCreateEventCreateNewEvent event,
    Emitter<BlocCreateEventState> emit,
  ) async {
    try {
      emit(BlocCreateStateLoading.from(state));
      String? imageUrl;

      if (state.image != null) {
        imageUrl = await _repositoryImages.createImage(
          state.image ?? XFile(''),
        );
      }
      final newEvent = FishingEvent(
        id: 0,
        departureTime: state.departureTime,
        createdBy: supabase.auth.currentUser?.id ?? '',
        title: state.title,
        description: state.description,
        fishingType: state.fishingType.map((e) => e.name).toList(),
        location: state.location,
        startDate: state.startDate ?? DateTime.now(),
        endDate: state.endDate ?? DateTime.now(),
        status: state.status.index,
        imageUrl: imageUrl ?? '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _repositoryFishingEvent.createEvent(event: newEvent);
      emit(BlocCreateStateSuccessCreateEvent.from(state));
    } on Exception catch (e) {
      emit(
        BlocCreateStateError.from(
          state,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
