import 'package:app_fishing/utils/utils.dart';

extension FishingTypeExtension on FishingType {
  String get name {
    return switch (this) {
      FishingType.bagre => 'bagre',
      FishingType.boga => 'boga',
      FishingType.surubi => 'surubi',
      FishingType.dorado => 'dorado',
      FishingType.tararira => 'tararira',
      FishingType.pejerrey => 'pejerrey',
      FishingType.trucha => 'trucha',
      FishingType.pacu => 'pacu',
      _ => 'otro',
    };
  }
}
