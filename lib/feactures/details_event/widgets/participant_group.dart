import 'package:flutter/material.dart';

class ParticipantGroup extends StatelessWidget {
  const ParticipantGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                'Juan Perez',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(
                Icons.star,
                size: 25,
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
