import 'package:flutter/material.dart';

class ParticipantWidget extends StatelessWidget {
  const ParticipantWidget({
    required this.participantes,
    super.key,
  });

  /// Participantes
  final List<String> participantes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Participantes',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 56, // alto del contenedor de avatares
          child: Stack(
            children: [
              for (int i = 0; i < participantes.length; i++)
                Positioned(
                  left: i * 36,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(participantes[i]),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
