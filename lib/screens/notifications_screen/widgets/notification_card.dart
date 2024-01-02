// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationCard extends StatelessWidget {
  NotificationCard(
      {super.key,
      required this.content,
      required this.since,
      required this.type,
      required this.onTap});

  final String content;
  final String since;
  final String type;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: content.length < 51
                          ? 20
                          : content.length >= 51 && content.length < 80
                              ? 40
                              : 64),
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      color: type == '0'
                          ? const Color(0xff9747FF)
                          : type == '1'
                              ? const Color(0xffF11717)
                              : const Color(0xff44D300),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(since),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
