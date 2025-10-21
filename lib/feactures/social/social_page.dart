import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

@RoutePage()
class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  final TextEditingController _controller = TextEditingController();
  final MapController _mapController = MapController();
  List<dynamic> _suggestions = [];
  LatLng _center = const LatLng(-34.6037, -58.3816); // Buenos Aires

  Future<void> _searchSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() => _suggestions = []);
      return;
    }

    final url =
        'https://nominatim.openstreetmap.org/search?q=$query&countrycodes=ar&format=json&addressdetails=1&limit=5';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'User-Agent': 'flutter_map_app',
      },
    );

    if (response.statusCode == 200) {
      setState(
        () => _suggestions = json.decode(response.body) as List<dynamic>,
      );
    }
  }

  void _selectSuggestion(dynamic suggestion) {
    final lat = double.parse(suggestion['lat'] as String);
    final lon = double.parse(suggestion['lon'] as String);
    final name = suggestion['display_name'];

    setState(() {
      _center = LatLng(lat, lon);
      _controller.text = name as String;
      _suggestions = [];
    });

    _mapController.move(_center, 15);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Barra de búsqueda con autocompletado
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    onChanged: _searchSuggestions,
                    decoration: InputDecoration(
                      hintText: 'Buscar dirección...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  if (_suggestions.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _suggestions.length,
                        itemBuilder: (context, index) {
                          final s = _suggestions[index];

                          return ListTile(
                            title: Text(
                              s['display_name'] as String,
                              style: const TextStyle(fontSize: 14),
                            ),
                            onTap: () => _selectSuggestion(s),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),

            // Mapa
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _center,
                    initialZoom: 12,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _center,
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
