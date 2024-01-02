bool isSameDay(String date) {
  final today =
      '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';

  if (today == date) {
    return true;
  } else {
    return false;
  }
}
