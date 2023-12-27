import 'package:intl/intl.dart';

String formatDate(String date) {
  return DateFormat.MMMMEEEEd('ar')
      .format(DateTime.parse(date))
      .replaceAll('،', '');
}
