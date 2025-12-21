import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/feactures/create_event/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

@RoutePage()
class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  ///
  final TextEditingController _controllerName = TextEditingController();

  ///
  final TextEditingController _controllerDate = TextEditingController();

  ///
  final TextEditingController _controllerTime = TextEditingController();

  ///
  final TextEditingController _controllerLocation = TextEditingController();

  ///
  final TextEditingController _controllerParticipants = TextEditingController();

  ///
  final TextEditingController _controllerDescription = TextEditingController();

  ///
  final MapController _mapController = MapController();

  @override
  void dispose() {
    _controllerParticipants.dispose();
    _controllerLocation.dispose();
    _controllerDescription.dispose();
    _mapController.dispose();
    _controllerName.dispose();
    _controllerDate.dispose();
    _controllerTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarCustom(
              title: 'Create Event',
              onPressed: () => Navigator.pop(context),
              iconLeft: Icons.close_outlined,
            ),
            const SizedBox(height: 30),
            const PickImage(),
            const SizedBox(height: 10),
            InputName(controllerName: _controllerName),
            const SizedBox(height: 10),
            InputDate(controllerDate: _controllerDate),
            const SizedBox(height: 10),
            ImputTime(controllerTime: _controllerTime),
            const SizedBox(height: 10),
            SelectLocation(
              controllerLotaion: _controllerLocation,
              mapController: _mapController,
            ),
            const SizedBox(height: 10),
            InputDescription(controllerDescription: _controllerDescription),
            const SizedBox(height: 10),
            InputParticipants(controllerParticipants: _controllerParticipants),
            const SizedBox(height: 10),
            const PrivacySelector(),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                //! Acción al crear el evento
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create event',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
