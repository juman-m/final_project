String remainingDays(String date) {
  Duration calculateDifference =
      DateTime.parse(date).difference(DateTime.now());
  int difference = calculateDifference.inDays + 1;
  if (difference == 1) {
    return 'يوم';
  } else if (difference == 2) {
    return 'يومان';
  } else if (difference > 2 && difference < 11) {
    return '\t\t$difference\nأيام';
  } else {
    return '\t$difference\nيوم';
  }
}
