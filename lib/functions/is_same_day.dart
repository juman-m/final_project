bool isSameDay(String date) {
  final today =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
  if (today == date) {
    return true;
  } else {
    return false;
  }
}
