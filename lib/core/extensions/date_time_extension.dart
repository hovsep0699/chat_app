import 'package:intl/intl.dart';

extension DateTimeFormatExtension on DateTime {
  String get formatRelative {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays == 1) {
      return 'Вчера'; // Yesterday
    } else if (difference.inDays > 1 && difference.inDays < 30) {
      return DateFormat('dd.MM.yy').format(this); // Date in "12.01.22" format
    } else if (difference.inMinutes < 1) {
      return 'Только что'; // Just now
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} минут назад'; // e.g., "2 минуты назад"
    } else if (difference.inHours < 24) {
      return DateFormat('HH:mm').format(this); // Time in "09:23" format
    } else {
      return DateFormat('dd.MM.yy').format(this); // Date in "12.01.22" format for older dates
    }
  }
}