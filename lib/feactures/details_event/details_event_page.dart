import 'package:auto_route/auto_route.dart';
import 'package:app_fishing/auto_route/auto_route.gr.dart';
import 'package:app_fishing/extensions/extensions.dart';
import 'package:app_fishing/feactures/auth/widgets/dialogs/dialogs.dart';
import 'package:app_fishing/feactures/details_event/bloc/details_event.dart';
import 'package:app_fishing/feactures/details_event/widgets/widgets.dart';
import 'package:app_fishing/feactures/widgets/widgets.dart';
import 'package:app_fishing/models/fishing_event/fishing_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DetailsEventPage extends StatelessWidget {
  const DetailsEventPage({
    @PathParam('id') required this.idEvent,
    super.key,
  });

  ///
  final int idEvent;

  ///
  void _onPressed(BuildContext context, FishingEvent? event) {
    if (event == null) return;

    if (event.isHost(context.supabase.auth.currentUser?.id ?? '')) {
      _dialogDeleteEvent(context);
    } else if (event.isUnited(context.supabase.auth.currentUser?.id ?? '')) {
      _dialogLeaveEvent(context);
    } else {
      context.read<BlocDetailsEvent>().add(const BlocDetailsEventEnterEvent());
    }
  }

  ///
  void _dialogDeleteEvent(BuildContext context) => showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: context.read<BlocDetailsEvent>(),
      child: DialogConfirm(
        title: 'Delete Event',
        message: 'Are you sure you want to delete this event?',
        onConfirm: () => context.read<BlocDetailsEvent>().add(
          const BlocDetailsEventDeleteEvent(),
        ),
      ),
    ),
  );

  ///
  void _dialogLeaveEvent(BuildContext context) => showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: context.read<BlocDetailsEvent>(),
      child: DialogConfirm(
        title: 'Leave Event',
        message: 'Are you sure you want to leave this event?',
        onConfirm: () => context.read<BlocDetailsEvent>().add(
          const BlocDetailsEventLeaveEvent(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final supabase = context.supabase;

    return BlocProvider<BlocDetailsEvent>(
      create: (context) =>
          BlocDetailsEvent(supabase: supabase)
            ..add(BlocDetailsEventGetEvent(id: idEvent)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarCustom(
              title: 'Detalle ',
              iconLeft: Icons.arrow_back_ios_outlined,
              onPressed: () => context.router.push(const HomeRoute()),
            ),
            const SizedBox(height: 15),
            BlocConsumer<BlocDetailsEvent, BlocDetailsEventState>(
              listener: (context, state) {
                if (state is BlocDetailsEventStateLoading) {
                  DialogLoading.showDialogLoading(context);
                }
                if (state is BlocDetailsEventStateSuccessJoinEvent) {
                  Navigator.of(context, rootNavigator: true).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Te has unido al evento'),
                    ),
                  );
                }
                if (state is BlocDetailsEventStateSuccessLeaveEvent) {
                  Navigator.of(context, rootNavigator: true).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Saliste del evento'),
                    ),
                  );
                }
                if (state is BlocDetailsEventStateError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                }
                if (state is BlocDetailsEventStateSuccessDeleteEvent) {
                  Navigator.of(context, rootNavigator: true).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Evento Elminado'),
                    ),
                  );
                  context.router.replace(const HomeRoute());
                }
              },
              builder: (context, state) {
                if (state is BlocDetailsEventStateLoadingInitial ||
                    state.event == null) {
                  return const SizedBox(
                    height: 400,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Column(
                  children: [
                    if (state.event?.imageUrl != null &&
                        state.event?.imageUrl != '')
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              state.event?.imageUrl ?? '',
                            ),
                            onError: (exception, stackTrace) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: Colors.red,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else
                      const SizedBox(
                        height: 300,
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            state.event?.title ?? '...',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Fecha de inicio: ${state.event?.startDate.formatTimeSpanish ?? '...'}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Fecha de Finalizacion: ${state.event?.endDate.formatTimeSpanish ?? '...'}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Ubicacion: ${state.event?.location ?? '...'}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // SelectLocation(
                          //   controllerLotaion: controller,
                          //   mapController: MapController(),
                          //   withTextField: false,
                          // ),
                          const SizedBox(height: 15),
                          Text(
                            'Descripcion: ${state.event?.description ?? '...'}',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ParticipantWidget(
                            participants: state.event?.participants ?? [],
                          ),
                          const SizedBox(height: 10),
                          ...state.event?.participants
                                  .map(
                                    (e) => ParticipantGroup(
                                      participant: e,
                                      isAdmin:
                                          state.event?.isHost(e.userId) ??
                                          false,
                                    ),
                                  )
                                  .toList() ??
                              [],

                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        state.event?.isUnited(
                                              context
                                                  .supabase
                                                  .auth
                                                  .currentUser!
                                                  .id,
                                            ) ??
                                            false ||
                                                (state.event?.isHost(
                                                      context
                                                          .supabase
                                                          .auth
                                                          .currentUser!
                                                          .id,
                                                    ) ??
                                                    false)
                                        ? Colors.redAccent
                                        : Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                  onPressed: () =>
                                      _onPressed(context, state.event),
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        (state.event?.isHost(
                                                  context
                                                      .supabase
                                                      .auth
                                                      .currentUser!
                                                      .id,
                                                ) ??
                                                false)
                                            ? 'Eliminar'
                                            : (state.event?.isUnited(
                                                    context
                                                        .supabase
                                                        .auth
                                                        .currentUser!
                                                        .id,
                                                  ) ??
                                                  false)
                                            ? 'Salir'
                                            : 'Unirse',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
