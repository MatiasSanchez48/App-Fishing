import 'package:app_fishing/feactures/create_event/bloc/bloc_create_event.dart';
import 'package:app_fishing/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacySelector extends StatefulWidget {
  const PrivacySelector({super.key});

  @override
  State<PrivacySelector> createState() => _PrivacySelectorState();
}

class _PrivacySelectorState extends State<PrivacySelector> {
  EventStatus selectedOption = EventStatus.public;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Privacidad',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        OptionCustom(
          title: 'Público',
          subTitle: 'Cualquier persona puede unirse',
          isSelected: selectedOption == EventStatus.public,
          onTap: () {
            setState(() => selectedOption = EventStatus.public);
            context.read<BlocCreateEvent>().add(
              const BlocCreateEventSaveEvent(status: EventStatus.public),
            );
          },
        ),
        const SizedBox(height: 10),
        OptionCustom(
          title: 'Privado',
          subTitle: 'Solo los invitados pueden unirse',
          isSelected: selectedOption == EventStatus.private,
          onTap: () {
            setState(() => selectedOption = EventStatus.private);
            context.read<BlocCreateEvent>().add(
              const BlocCreateEventSaveEvent(status: EventStatus.private),
            );
          },
        ),
      ],
    );
  }
}

class OptionCustom extends StatelessWidget {
  const OptionCustom({
    required this.title,
    required this.subTitle,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  ///
  final String title;

  ///
  final String subTitle;

  ///
  final bool isSelected;

  ///
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.blue.withValues(alpha: 0.1),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
