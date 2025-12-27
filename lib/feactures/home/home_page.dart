import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/feactures/home/bloc/bloc_home.dart';
import 'package:chat_flutter_supabase/feactures/home/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppbarCustom(
              title: 'Home',
              iconRight: Icons.settings_outlined,
            ),
            const SizedBox(height: 30),

            const Text(
              'Proximas Salidas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),
            BlocBuilder<BlocHome, BlocHomeState>(
              builder: (context, state) {
                if (state is BlocHomeStateLoading) {
                  return const SizedBox(
                    height: 230,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return SizedBox(
                  height: 230,
                  child: ListView.builder(
                    itemCount: state.events.take(3).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CardLeave(
                      event: state.events[index],
                    ),
                  ),
                );
              },
            ),
            const Text(
              'Evento Mas Cercanos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CardEventEarly(),
            const SizedBox(height: 20),
            const Text(
              'Publicaciones',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const SocialCardEvent(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
