import 'package:app_fishing/models/fishing_event/fishing_event_model.dart';

extension FishingEventExtension on FishingEvent {
  static List<FishingEvent> sortByDate(List<FishingEvent> events) {
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day);

    final upcoming =
        events.where((e) => !e.startDate.isBefore(startOfToday)).toList()
          ..sort((a, b) => a.startDate.compareTo(b.startDate));

    final past =
        events.where((e) => e.startDate.isBefore(startOfToday)).toList()
          ..sort((a, b) => b.startDate.compareTo(a.startDate));

    return [...upcoming, ...past];
  }

  bool isUnited(String userId) => participants.any((e) => e.userId == userId);

  bool isHost(String userId) => createdBy == userId;
}
