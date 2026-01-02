import 'package:chat_flutter_supabase/feactures/profile/bloc/bloc_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<BlocProfile, BlocProfileState>(
          builder: (context, state) {
            return Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: .6,
                  ),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: (state is BlocProfileStateLoadingEvents)
                      ? const Center(child: CircularProgressIndicator())
                      : const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '12',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'Publicaciones',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          },
        ),
        BlocBuilder<BlocProfile, BlocProfileState>(
          builder: (context, state) {
            return Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: .6,
                  ),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: (state is BlocProfileStateLoadingEvents)
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              (state.eventsCreated.length +
                                      state.eventsUnited.length)
                                  .toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            const Text(
                              'Eventos',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
