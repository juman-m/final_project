import 'dart:async';
import 'package:final_project/blocs/timer_bloc/timer_bloc.dart';
import 'package:final_project/blocs/timer_bloc/timer_event.dart';
import 'package:final_project/blocs/timer_bloc/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class TestingScreenWithBloc extends StatelessWidget {
  TestingScreenWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<TimerBloc>()
        .add(CountDownEvent(deadline: DateTime.parse('2023-12-28 09:20')));
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              if (state is CountDownState) {
                return Text(
                  state.countDownTime,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
