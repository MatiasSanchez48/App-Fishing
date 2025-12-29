import 'package:chat_flutter_supabase/models/models.dart';
import 'package:flutter/material.dart';

class ParticipantWidget extends StatelessWidget {
  const ParticipantWidget({
    required this.participants,
    super.key,
  });

  /// Participantes
  final List<EventParticipant> participants;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Participants',
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
              for (int i = 0; i < participants.length; i++)
                Positioned(
                  left: i * 36,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child:
                        (participants[i].users?.avatarUrl == null ||
                            participants[i].users?.avatarUrl == '')
                        ? const CircleAvatar(
                            radius: 26,
                            child: Text(
                              '?',
                            ),
                          )
                        : CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(
                              participants[i].users?.avatarUrl ?? '',
                            ),
                            onBackgroundImageError: (exception, stackTrace) =>
                                const CircleAvatar(
                                  radius: 26,
                                  child: Text(
                                    '?',
                                  ),
                                ),
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
