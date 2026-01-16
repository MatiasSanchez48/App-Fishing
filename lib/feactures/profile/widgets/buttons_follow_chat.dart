import 'package:app_fishing/auto_route/auto_route.gr.dart';
import 'package:app_fishing/extensions/extensions.dart';
import 'package:app_fishing/feactures/widgets/dialogs/dialog_confirm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ButtonChat extends StatelessWidget {
  const ButtonChat({
    required this.id,
    super.key,
  });

  ///
  final String id;

  void _logout(BuildContext context) => showDialog<void>(
    context: context,
    builder: (_) => DialogConfirm(
      message: '¿Desea cerrar sesión?',
      title: 'Cerrar sesión',
      onConfirm: () => context.supabase.auth.signOut().then(
        (_) => context.router.replace(const LoginRoute()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => _logout(context),
            child: const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Cerrar sesión',
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
        // if (id == (context.supabase.auth.currentUser?.id ?? '')) ...[
        //   const SizedBox(width: 30),
        //   Expanded(
        //     child: TextButton(
        //       style: TextButton.styleFrom(
        //         backgroundColor: Colors.grey[300],
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //       ),
        //       onPressed: () {
        //         /// TODO : Navegar a la pantalla del perfil
        //       },
        //       child: const SizedBox(
        //         height: 50,
        //         child: Center(
        //           child: Text(
        //             'Chats',
        //             style: TextStyle(
        //               fontSize: 16,
        //               color: Colors.black,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ],
    );
  }
}
