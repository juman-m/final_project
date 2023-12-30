import 'package:final_project/screens/create_rate_screen/widgets/cancel_button.dart';
import 'package:flutter/material.dart';

class CreateRateScreen extends StatelessWidget {
  const CreateRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            const CancelButton(),
            Container(
              padding: const EdgeInsets.only(bottom: 0),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color.fromARGB(67, 0, 0, 0))),
              child: Column(
                children: [
                  Text('data'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
