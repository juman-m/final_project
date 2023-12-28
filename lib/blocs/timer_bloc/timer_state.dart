abstract class TimerState {}

final class TimerInitial extends TimerState {}

final class CountDownState extends TimerState {
  final String countDownTime;
  CountDownState({required this.countDownTime});
}
