import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:chat_flutter_supabase/feactures/home/bloc/bloc_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlocHome, BlocHomeState>(
        builder: (context, state) {
          if (state is BlocHomeStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BlocHomeStateError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.users.map(
                (usuario) => InkWell(
                  onTap: () => context.pushRoute(
                    MessageRoute(idPerson: usuario.uuid),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (usuario.avatarUrl != null &&
                            usuario.avatarUrl!.isNotEmpty)
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(usuario.avatarUrl!),
                          )
                        else
                          const CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.person, size: 30),
                          ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              usuario.username,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              usuario.email,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 100,
                          child: Center(
                            child: Text(
                              'Unido desde: ${DateFormat('dd/MM/yyyy').format(usuario.createdAt ?? DateTime.now())}',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
