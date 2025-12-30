import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get formatDateSpanish =>
      DateFormat("d 'de' MMMM", 'es_ES').format(this);

  String get formatTimeSpanish =>
      DateFormat("EEEE, d 'de' MMMM", 'es_ES').format(this);
}
