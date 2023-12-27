import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dialOnly)
                    .then(
                  (value) {},
                );
              },
              child: const Text('SHOW'),
            ),
          ),
          const SizedBox(height: 64),
          Center(
            child: ElevatedButton(
              child: const Text('TEST'),
              onPressed: () {
                final today = DateTime.parse(
                    DateFormat('yyyy-MM-dd').format(DateTime.now()));
                final noToday = DateTime(2023, 12, 24);
                print(today);
                if (today.isAfter(noToday)) {
                  print('AFTER');
                } else if (today.isBefore(noToday)) {
                  print('BEFORE');
                } else {
                  print('SAME');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
