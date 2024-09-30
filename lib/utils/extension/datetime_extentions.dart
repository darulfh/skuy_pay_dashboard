import 'package:intl/intl.dart';

extension DateTimeExtenstion on DateTime? {
  /// Change [DateTime] become 17-02-2002
  String toTime([bool onlyDate = true]) {
    final date = this?.toUtc().toLocal();
    if (onlyDate) {
      return "${date?.day}-${date?.month}-${date?.year}";
    } else {
      return "${date?.day}-${date?.month}-${date?.year} ${date?.hour.toString().padLeft(2, '0')}:${date?.minute.toString().padLeft(2, '0')}:${date?.second.toString().padLeft(2, '0')}";
    }
  }

  String toChangeMonth([bool onlyDate = true]) {
    if (this == null) {
      return "--:--:--";
    }
    final date = this?.toUtc().toLocal();
    if (onlyDate) {
      return "${date?.day} ${_month[date?.month]} ${date?.year}";
    } else {
      return "${date?.day} ${_month[date?.month]} ${date?.year} - ${date?.hour.toString().padLeft(2, '0')}:${date?.minute.toString().padLeft(2, '0')}";
    }
  }

  String toTimeWithMinute() =>
      "${this?.day} ${_month[this?.month]} ${this?.year}";

  DateTime toThisMonth() {
    return DateTime(this!.year, this!.month, this!.day);
  }

  DateTime toThisFirstDayMonth() {
    return DateTime(this!.year, this!.month, 1);
  }

  String? checkTwoDateTime(DateTime? time) {
    if (time?.day == this?.day &&
        time?.month == this?.month &&
        time?.year == this?.year) {
      return DateTime.now().toIso8601String();
    }

    return this?.toIso8601String();
  }

  String lastTimeChat() {
    if (this == null) return "";

    final dateTime = this!.toLocal();
    final DateTime now = DateTime.now();
    final DateTime lastMidnight = DateTime(now.year, now.month, now.day);
    final DateTime beginOfThisYear = DateTime(now.year);

    if (dateTime.isAfter(lastMidnight)) {
      ///today
      return DateFormat('HH:mm').format(dateTime);
    } else if (dateTime.isAfter(beginOfThisYear)) {
      ///this year
      return DateFormat('d MMM').format(dateTime);
    } else {
      ///any other day
      return DateFormat('d MMM yyyy').format(dateTime);
    }
  }

  String timeMessage() {
    if (this == null) return "";
    return DateFormat('HH:mm').format(this!.toLocal());
  }
}

extension StringToDateTime on String {
  /// Change [DateTime] become 17-02-2002
  String toTime([bool onlyDate = true]) =>
      DateTime.tryParse(this).toTime(onlyDate);
  String toChangeMonth([bool onlyDate = true]) =>
      DateTime.tryParse(this).toChangeMonth(onlyDate);
  DateTime? parseDateTime() => DateTime.tryParse(this);
  String toTimeWithMinute() => DateTime.tryParse(this).toTimeWithMinute();
  String toTimeLastChat() => DateTime.tryParse(this).lastTimeChat();
  String timeMessage() => DateTime.tryParse(this).timeMessage();
  String splitTime() => split("T")[0];
}

const Map<int, String> _month = {
  1: "Januari",
  2: "Februari",
  3: "Maret",
  4: "April",
  5: "Mei",
  6: "Juni",
  7: "Juli",
  8: "Agustus",
  9: "September",
  10: "Oktober",
  11: "November",
  12: "Desember",
};
