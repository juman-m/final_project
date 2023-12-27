timeSplitter({dynamic time}) {
  if (time == null) {
    return null;
  }
  List<String> dividedTime = [];
  final timeList = time!.split(':');
  dividedTime.add(timeList[0]);
  final timeList2 = timeList[1].toString().split(' ');
  dividedTime.add(timeList2[0]);
  dividedTime.add(timeList2[1]);

  return dividedTime;
}
