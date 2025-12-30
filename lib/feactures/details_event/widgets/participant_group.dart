import 'package:chat_flutter_supabase/models/event_participant/event_participant_model.dart';
import 'package:flutter/material.dart';

class ParticipantGroup extends StatelessWidget {
  const ParticipantGroup({
    required this.participant,
    this.isAdmin = false,
    super.key,
  });

  ///
  final EventParticipant participant;

  ///
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: InkWell(
          onTap: () {
            /// TODO : Navegar a la pantalla del perfil
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  participant.users?.username ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (isAdmin)
                  const Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.orangeAccent,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
