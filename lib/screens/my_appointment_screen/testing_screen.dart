import 'dart:async';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TestingScreen extends StatefulWidget {
  TestingScreen({super.key});
  String dateFromDatabase = '2023-12-28';
  String timeFromDatabase = '16:30';
  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  Timer? timer;
  Duration duration = const Duration();
  DateTime deadline = DateTime.parse('2023-12-28 11:34');
  // remainingTime() {
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     leftTime(deadline);
  //   });
  // }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      leftTime(deadline);
    });
    super.initState();
  }

  @override
  // void dispose() {
  //   timer!.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final hours = duration.inHours.toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       timer!.cancel();
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(Icons.arrow_back)),
          ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$hours:$minutes:$seconds',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  leftTime(DateTime deadline) {
    final seconds = deadline.difference(DateTime.now()).inSeconds;
    if (!mounted) return;
    setState(() {
      duration = Duration(seconds: seconds);
    });
  }
}