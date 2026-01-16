import 'package:auto_route/auto_route.dart';
import 'package:app_fishing/auto_route/auto_route.gr.dart';
import 'package:app_fishing/extensions/extensions.dart';
import 'package:app_fishing/models/fishing_event/fishing_event_model.dart';
import 'package:flutter/material.dart';

class CardLeave extends StatelessWidget {
  const CardLeave({
    required this.event,
    super.key,
  });

  ///
  final FishingEvent event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(DetailsEventRoute(idEvent: event.id)),
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                    color: Colors.red,
                  ),

                  image: NetworkImage(event.imageUrl ?? ''),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 300,
              child: Text(
                event.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 3),
            SizedBox(
              width: 300,
              child: Text(
                event.startDate.formatDateSpanish,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
