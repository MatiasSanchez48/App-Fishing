import 'package:auto_route/auto_route.dart';
import 'package:app_fishing/auto_route/auto_route.gr.dart';
import 'package:app_fishing/feactures/auth/widgets/dialogs/dialogs.dart';
import 'package:app_fishing/feactures/create_event/bloc/bloc_create_event.dart';
import 'package:app_fishing/feactures/create_event/widgets/widgets.dart';
import 'package:app_fishing/feactures/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_map/flutter_map.dart';

@RoutePage()
class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  ///
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///
  final TextEditingController _controllerName = TextEditingController();

  ///
  final TextEditingController _controllerDateStart = TextEditingController();

  ///
  final TextEditingController _controllerDateFinish = TextEditingController();

  ///
  final TextEditingController _controllerTime = TextEditingController();

  ///
  final TextEditingController _controllerLocation = TextEditingController();

  ///
  final TextEditingController _controllerParticipants = TextEditingController();

  ///
  final TextEditingController _controllerDescription = TextEditingController();

  ///
  // final MapController _mapController = MapController();

  ///
  DateTime? dateStart;

  /// Selecciona la fecha de inicio y se actualiza el estado del segundo
  void _selectDateStart(DateTime date) => setState(() {
    dateStart = date;
    context.read<BlocCreateEvent>().add(
      BlocCreateEventSaveEvent(startDate: date),
    );
    // Si ya hay una fecha de finalización seleccionada
    if (_controllerDateFinish.text.isNotEmpty) {
      final parts = _controllerDateFinish.text.split('/');

      if (parts.length == 3) {
        final finishDate = DateTime(
          int.parse(parts[2]),
          int.parse(parts[1]),
          int.parse(parts[0]),
        );

        if (finishDate.isBefore(dateStart!)) {
          _controllerDateFinish.clear();
        }
      }
    }
  });

  @override
  void dispose() {
    // _mapController.dispose();
    _controllerName.dispose();
    _controllerTime.dispose();
    _controllerLocation.dispose();
    _controllerDateStart.dispose();
    _controllerDateFinish.dispose();
    _controllerDescription.dispose();
    _controllerParticipants.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocCreateEvent, BlocCreateEventState>(
      listener: (context, state) {
        if (!mounted) return;

        if (state is BlocCreateStateLoading) {
          DialogLoading.showDialogLoading(context);
        }

        if (state is BlocCreateStateError) {
          Navigator.of(context, rootNavigator: true).pop();
          DialogError(
            description: state.errorMessage,
          ).showDialogError(context);
        }

        if (state is BlocCreateStateSuccessCreateEvent) {
          Navigator.of(context, rootNavigator: true).pop();

          DialogSuccess(
            onOk: () {
              Navigator.of(context, rootNavigator: true).pop();
              context.router.replace(const HomeRoute());
            },
            description: 'Evento creado exitosamente',
          ).showDialogSuccess(context);
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarCustom(
                  title: 'Crear evento',
                  onPressed: () => Navigator.pop(context),
                  iconLeft: Icons.close_outlined,
                ),
                const SizedBox(height: 30),
                const PickImage(),
                const SizedBox(height: 10),
                InputName(
                  controllerName: _controllerName,
                  onChanged: (v) => context.read<BlocCreateEvent>().add(
                    BlocCreateEventSaveEvent(title: v),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputDate(
                      controllerDate: _controllerDateStart,
                      onDateSelected: _selectDateStart,
                      hintText: 'Fecha de inicio',
                      isDateSelected: true,
                    ),
                    InputDate(
                      isDateSelected: dateStart != null,
                      controllerDate: _controllerDateFinish,
                      firstDate: dateStart,
                      hintText: 'Fecha final',
                      onDateSelected: (date) {
                        context.read<BlocCreateEvent>().add(
                          BlocCreateEventSaveEvent(endDate: date),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ImputTime(controllerTime: _controllerTime),
                const SizedBox(height: 10),
                SelectLocation(
                  controllerLotaion: _controllerLocation,
                  // mapController: _mapController,
                ),
                const SizedBox(height: 10),
                InputDescription(controllerDescription: _controllerDescription),
                const SizedBox(height: 10),
                InputParticipants(
                  controllerParticipants: _controllerParticipants,
                ),
                const SizedBox(height: 10),
                const PrivacySelector(),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<BlocCreateEvent>().add(
                        BlocCreateEventSaveEvent(
                          location: _controllerLocation.text,
                        ),
                      );
                      context.read<BlocCreateEvent>().add(
                        const BlocCreateEventCreateNewEvent(),
                      );
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: BlocBuilder<BlocCreateEvent, BlocCreateEventState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state is BlocCreateStateLoading) ...[
                              const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            ] else
                              const Text(
                                'Crear evento',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
