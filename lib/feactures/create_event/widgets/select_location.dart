// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:http/http.dart' as http;
// import 'package:latlong2/latlong.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({
    required this.controllerLotaion,
    // required this.mapController,
    this.withTextField = true,
    super.key,
  });

  ///
  final TextEditingController controllerLotaion;

  ///
  // final MapController mapController;

  ///
  final bool withTextField;
  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  ///
  // List<dynamic> _suggestions = [];

  // ///
  // LatLng _center = const LatLng(-34.6037, -58.3816); // Buenos Aires
  // ///
  // Future<void> _searchSuggestions(String query) async {
  //   if (query.isEmpty) {
  //     setState(() => _suggestions = []);
  //     return;
  //   }

  //   final url =
  //       'https://nominatim.openstreetmap.org/search?q=$query&countrycodes=ar&format=json&addressdetails=1&limit=5';
  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'User-Agent': 'flutter_map_app',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final results = json.decode(response.body) as List<dynamic>;
  //     setState(
  //       () => _suggestions = json.decode(response.body) as List<dynamic>,
  //     );
  //     // Si hay resultados y el texto coincide exactamente, seleccionar automáticamente
  //     if (results.isNotEmpty && widget.controllerLotaion.text.isNotEmpty) {
  //       // Opcional: auto-seleccionar el primer resultado si hay coincidencia exacta
  //       // _selectSuggestion(results[0], autoSelected: true);
  //     }
  //   }
  // }

  // ///
  // void _selectSuggestion(dynamic suggestion) {
  //   final lat = double.parse(suggestion['lat'] as String);
  //   final lon = double.parse(suggestion['lon'] as String);
  //   final name = suggestion['display_name'];

  //   setState(() {
  //     _center = LatLng(lat, lon);
  //     widget.controllerLotaion.text = name as String;
  //     _suggestions = [];
  //   });

  //   widget.mapController.move(_center, 15);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // Si ya hay texto en el controlador, buscar esa ubicación
  //   if (widget.controllerLotaion.text.isNotEmpty) {
  //     _searchSuggestions(widget.controllerLotaion.text);
  //   }
  // }

  @override
  void dispose() {
    widget.controllerLotaion.dispose();
    // widget.mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.withTextField)
          SizedBox(
            height: 80,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controllerLotaion,
              // onChanged: _searchSuggestions,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a location';
                }
                return null;
              },
              decoration: InputDecoration(
                helperText: ' ',
                prefixIcon: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Ubicacion',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
              ),
            ),
          ),
        // if (_suggestions.isNotEmpty && widget.withTextField)
        //   Container(
        //     margin: const EdgeInsets.only(top: 4),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(8),
        //       border: Border.all(color: Colors.grey.shade300),
        //     ),
        //     child: ListView.builder(
        //       shrinkWrap: true,
        //       itemCount: _suggestions.length,
        //       itemBuilder: (context, index) {
        //         final s = _suggestions[index];

        //         return ListTile(
        //           title: Text(
        //             s['display_name'] as String,
        //             style: const TextStyle(fontSize: 14),
        //           ),
        //           onTap: () => _selectSuggestion(s),
        //         );
        //       },
        //     ),
        //   ),
        // const SizedBox(height: 10),
        // SizedBox(
        //   height: 200,
        //   width: double.infinity,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(12),
        //     child: FlutterMap(
        //       mapController: widget.mapController,
        //       options: MapOptions(
        //         initialCenter: _center,
        //         initialZoom: 12,
        //       ),
        //       children: [
        //         TileLayer(
        //           urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        //           userAgentPackageName: 'com.example.app',
        //         ),
        //         MarkerLayer(
        //           markers: [
        //             Marker(
        //               point: _center,
        //               width: 40,
        //               height: 40,
        //               child: const Icon(
        //                 Icons.location_pin,
        //                 color: Colors.red,
        //                 size: 40,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
