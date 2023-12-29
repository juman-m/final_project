import 'dart:async';
import 'package:final_project/blocs/timer_bloc/timer_event.dart';
import 'package:final_project/blocs/timer_bloc/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<CountDownEvent>((event, emit) async {
      // Duration duration = const Duration();
      Timer.periodic(const Duration(seconds: 1), (timer) async {
        final counter = event.deadline.difference(DateTime.now()).inSeconds;
        Duration duration = Duration(seconds: counter);
        final seconds =
            duration.inSeconds.remainder(60).toString().padLeft(2, '0');
        final minutes =
            duration.inMinutes.remainder(60).toString().padLeft(2, '0');
        final hours = duration.inHours.toString().padLeft(2, '0');
        emit(CountDownState(countDownTime: '$hours:$minutes:$seconds'));
        add(CountDownEvent(deadline: event.deadline));
      });
    });
  }
}
