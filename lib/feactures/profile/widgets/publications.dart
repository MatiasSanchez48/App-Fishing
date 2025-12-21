import 'package:flutter/material.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          isScrollable: true,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          tabAlignment: TabAlignment.start,
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: 'Eventos'),
            Tab(text: 'Actividad'),
            Tab(text: 'Logros'),
          ],
        ),
        SizedBox(
          height: 650,
          child: TabBarView(
            controller: _tabController,
            children: const [
              _EventosTab(),
              Center(child: Text('Actividad reciente')),
              Center(child: Text('Logros del usuario')),
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
  final eventosCreados = [
    {
      'imagen': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
      'titulo': 'Pesca en el río Grande',
      'fecha': '15 de julio',
    },
    {
      'imagen': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
      'titulo': 'Torneo de pesca en el lago Azul',
      'fecha': '22 de agosto',
    },
  ];

  final eventosUnidos = [
    {
      'imagen': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
      'titulo': 'Pesca nocturna en el lago Escondido',
      'fecha': '5 de julio',
    },
    {
      'imagen': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
      'titulo': 'Pesca de truchas en el río Claro',
      'fecha': '10 de julio',
    },
  ];

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
          _buildGrid(eventosCreados),
          const SizedBox(height: 20),
          const Text(
            'Eventos a los que se ha unido',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _buildGrid(eventosUnidos),
        ],
      ),
    );
  }

  Widget _buildGrid(List<Map<String, String>> eventos) {
    return GridView.builder(
      itemCount: eventos.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final evento = eventos[index];
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  evento['imagen']!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      evento['titulo']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      evento['fecha']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
