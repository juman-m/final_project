import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.name,
    required this.time,
    required this.content,
  });
  final String name;
  final String time;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color.fromARGB(67, 0, 0, 0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xff0086D3),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(
                color: Color.fromARGB(102, 0, 0, 0),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
