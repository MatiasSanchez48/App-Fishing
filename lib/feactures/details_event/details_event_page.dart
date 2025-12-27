import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/feactures/create_event/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/details_event/bloc/details_event.dart';
import 'package:chat_flutter_supabase/feactures/details_event/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

@RoutePage()
class DetailsEventPage extends StatelessWidget {
  const DetailsEventPage({
    @PathParam('id') required this.idEvent,
    super.key,
  });

  ///
  final int idEvent;

  @override
  Widget build(BuildContext context) {
    //! cuando se guarde una ubicacion dentro del mapa hacerla inicializar con
    //! esa ubicacion
    final controller = TextEditingController(
      text:
          'AZ Sanitarios, Pío XII, Villa María, Resistencia, Municipio de Resistencia, Departamento San Fernando, Chaco, H3500BXB, Argentina',
    );
    return BlocProvider<BlocDetailsEvent>(
      create: (context) => BlocDetailsEvent(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarCustom(
              title: 'Details event',
              iconLeft: Icons.arrow_back_ios_outlined,
              onPressed: () => context.router.pop(),
            ),
            const SizedBox(height: 15),
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'data:image/jpeg;base64,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',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'Pesca en el lago sereno',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Sabado,15 de agosto,8:00 AM',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SelectLocation(
                    controllerLotaion: controller,
                    mapController: MapController(),
                    withTextField: false,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Disfruta de una hjornada de pesca en el hermosos lago '
                    'sereno.trae tu equipo y preparate para capturar truchas '
                    'y lucios. No olvides tu licencia de pesca!',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ParticipantWidget(
                    participantes: [
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQQfxYpY2CJj9kLzsqFbToLmAFDHlaycyG8OKXmLwKLNL0OAKGbHL6nxJozMinyMvua3s&usqp=CAU',
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOb5I7AzYilmOUqrBDSTeRUZOLT5HXi6F0WyrgIlCVGkmEKG6lDH9zs4YpGA0JZ7SfQqI&usqp=CAU',
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbYr_i15OiM1l6jW9Mde0cbssd5Q_-kyPEZWjb5DZlbeCu0Km4DvpsHeqDzLNk_ELLZ4g&usqp=CAU',
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScJFZj_9g4Vwa4oeLLjW5I_h1k6ml-q3p-3YCrS33r8gf1g-zo9Ygr6ZrBEebcb40OfF4&usqp=CAU',
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbYr_i15OiM1l6jW9Mde0cbssd5Q_-kyPEZWjb5DZlbeCu0Km4DvpsHeqDzLNk_ELLZ4g&usqp=CAU',
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQQfxYpY2CJj9kLzsqFbToLmAFDHlaycyG8OKXmLwKLNL0OAKGbHL6nxJozMinyMvua3s&usqp=CAU',
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScJFZj_9g4Vwa4oeLLjW5I_h1k6ml-q3p-3YCrS33r8gf1g-zo9Ygr6ZrBEebcb40OfF4&usqp=CAU',
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOb5I7AzYilmOUqrBDSTeRUZOLT5HXi6F0WyrgIlCVGkmEKG6lDH9zs4YpGA0JZ7SfQqI&usqp=CAU',
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScJFZj_9g4Vwa4oeLLjW5I_h1k6ml-q3p-3YCrS33r8gf1g-zo9Ygr6ZrBEebcb40OfF4&usqp=CAU',
                    ],
                  ),
                  const SizedBox(height: 10),
                  const ParticipantGroup(),
                  const SizedBox(height: 10),
                  const ParticipantGroup(),
                  const SizedBox(height: 10),
                  const ParticipantGroup(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            /// TODO : Navegar a la pantalla del perfil
                          },
                          child: const SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                'Unirse',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            /// TODO : Navegar a la pantalla del perfil
                          },
                          child: const SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                'Chat',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
        ),
      ),
    );
  }
}
