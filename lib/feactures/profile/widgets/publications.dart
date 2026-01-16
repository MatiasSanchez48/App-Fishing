import 'package:app_fishing/feactures/profile/bloc/bloc_profile.dart';
import 'package:app_fishing/feactures/profile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Publications extends StatefulWidget {
  const Publications({super.key});

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          indicatorColor: Colors.blue,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
          tabs: const [
            Tab(text: 'Eventos'),
            Tab(text: 'Actividad'),
          ],
        ),
        SizedBox(
          height: 500,
          child: TabBarView(
            controller: _tabController,
            children: const [
              _EventosTab(),
              Center(child: Text('Actividad reciente')),
            ],
          ),
        ),
      ],
    );
  }
}

class _EventosTab extends StatefulWidget {
  const _EventosTab();

  @override
  State<_EventosTab> createState() => _EventosTabState();
}

class _EventosTabState extends State<_EventosTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Eventos creados',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<BlocProfile, BlocProfileState>(
            builder: (context, state) {
              if (state is BlocProfileStateLoadingEvents) {
                return const Center(child: CircularProgressIndicator());
              }
              return GridCardEvents(event: state.eventsCreated);
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Eventos a los que se ha unido',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<BlocProfile, BlocProfileState>(
            builder: (context, state) {
              if (state is BlocProfileStateLoadingEvents) {
                return const Center(child: CircularProgressIndicator());
              }
              return GridCardEvents(event: state.eventsUnited);
            },
          ),
        ],
      ),
    );
  }
}
