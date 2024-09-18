import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String defaultFormat() => DateFormat('MM/dd/yyyy').format(this);

  String toddmmyyyy() => DateFormat('dd-MM-yyyy').format(this);

  /// Returns `date` in UTC format, without its time part.
  DateTime normalizeDate() {
    return DateTime.utc(year, month, day);
  }
}

extension NullableDateTimeExt on DateTime? {
  String defaultFormat({String? dateformat}) => this == null ? '' : DateFormat(dateformat ?? 'MM/dd/yyyy').format(this!);

  String toddmmyyyy() => this == null ? '' : DateFormat('dd-MM-yyyy').format(this!);

  /// Checks if two DateTime objects are the same day.
  /// Returns `false` if either of them is null.
  bool isSameDay(DateTime? dateTime) {
    if (this == null || dateTime == null) {
      return false;
    }

    return this!.year == dateTime.year && this!.month == dateTime.month && this!.day == dateTime.day;
  }
}
