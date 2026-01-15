import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/extensions/extensions.dart';
import 'package:chat_flutter_supabase/feactures/home/bloc/bloc_home.dart';
import 'package:chat_flutter_supabase/feactures/home/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///
  bool _seeMore = false;

  @override
  Widget build(BuildContext context) {
    final supabase = context.supabase;

    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(supabase: supabase),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const AppbarCustom(title: 'Inicio'),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Text(
                    'Proximas salidas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => setState(() => _seeMore = !_seeMore),
                      child: Text(
                        _seeMore ? 'Ver menos' : 'Ver Mas',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<BlocHome, BlocHomeState>(
                builder: (context, state) {
                  if (state is BlocHomeStateLoading) {
                    return const SizedBox(
                      height: 210,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state.myEvents.isEmpty) {
                    return SizedBox(
                      height: 210,
                      child: Center(
                        child: Text(
                          'No tienes eventos creados',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    );
                  }

                  return SizedBox(
                    height: _seeMore ? (state.myEvents.length * 220) : 220,
                    child: ListView.builder(
                      itemCount: _seeMore ? state.myEvents.length : 1,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CardEventEarly(
                        event: state.myEvents[index],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),
              const Text(
                'Eventos cercas de hoy',
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
                  if (state.events.isEmpty) {
                    return SizedBox(
                      height: 230,
                      child: Center(
                        child: Text(
                          'No hay eventos cerca de hoy',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
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

              const SizedBox(height: 20),
              const Text(
                'Eventos populares',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              BlocBuilder<BlocHome, BlocHomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.events.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => CardEventEarly(
                      event: state.events[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
