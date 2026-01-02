import 'package:chat_flutter_supabase/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ButtonChat extends StatelessWidget {
  const ButtonChat({
    required this.id,
    super.key,
  });

  ///
  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              /// TODO : Navegar a la pantalla del perfil
            },
            child: const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (id == (context.supabase.auth.currentUser?.id ?? '')) ...[
          const SizedBox(width: 30),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                /// TODO : Navegar a la pantalla del perfil
              },
              child: const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
