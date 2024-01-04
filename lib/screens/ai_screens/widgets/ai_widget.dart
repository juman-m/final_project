
import 'package:flutter/material.dart';


class AIBubble extends StatelessWidget {
  const AIBubble({
    Key? key,
    required this.isUser,
    required this.message,
  }) : super(key: key);

  final bool isUser;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isUser ? Colors.blue : Color.fromARGB(255, 229, 222, 222),
              gradient: isUser
                  ? LinearGradient(
                      colors: [
                        Color(0xFF008CDC),
                        Color(0xFF008CDC),
                        Color(0xFF00D785),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomRight: isUser
                    ? const Radius.circular(0)
                    : const Radius.circular(20),
                bottomLeft: isUser
                    ? const Radius.circular(20)
                    : const Radius.circular(0),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: isUser ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

