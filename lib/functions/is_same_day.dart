bool isSameDay(String date) {
  Duration difference = DateTime.parse(date).difference(DateTime.now());
  if (difference.inDays == 0) {
    return true;
  } else {
    return false;
  }
}
