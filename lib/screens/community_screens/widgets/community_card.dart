import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CommunityCard extends StatelessWidget {
  CommunityCard(
      {super.key,
      required this.name,
      required this.time,
      required this.content,
      required this.onTap});
  final String name;
  final String time;
  final String content;
  Function() onTap;
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
            const Divider(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.25,
              child: InkWell(
                onTap: onTap,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SvgPicture.asset(
                        'assets/comment.svg',
                        color: const Color.fromARGB(128, 0, 0, 0),
                        height: 32,
                        width: 32,
                      ),
                    ),
                    const Text(
                      'تعليق',
                      style: TextStyle(
                        color: Color.fromARGB(128, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
