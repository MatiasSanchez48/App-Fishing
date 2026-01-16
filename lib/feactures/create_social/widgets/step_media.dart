import 'package:app_fishing/feactures/create_social/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StepMedia extends StatefulWidget {
  const StepMedia({super.key});

  @override
  State<StepMedia> createState() => _StepMediaState();
}

class _StepMediaState extends State<StepMedia> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Add new photos',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            'Upload images of your capture so the community can see them.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const StepGallery(),
      ],
    );
  }
}
