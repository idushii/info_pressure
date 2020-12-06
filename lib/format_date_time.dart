part of 'main.dart';

formatDateTime(String dateTime) {
  return DateFormat('dd.MM.yyyy kk:mm').format(DateTime.parse(dateTime));
}
