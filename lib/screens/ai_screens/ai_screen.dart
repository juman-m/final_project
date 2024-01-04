import 'package:final_project/cubits/cubit/ai_cubit.dart';
import 'package:final_project/cubits/cubit/ai_state.dart';
import 'package:final_project/screens/ai_screens/widgets/ai2_widget.dart';
import 'package:final_project/screens/ai_screens/widgets/ai_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AIScreen extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  AIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AiCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 215, 214, 214),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Stack(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Color(0xFF008BDB), Color(0xFF00E2D5)],
                          ),
                          shape: CircleBorder(),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: ClipOval(
                          child: Container(
                            width: 37,
                            height: 37,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/AI.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

               
                  SizedBox(width: 16.0),
                  Text(
                    "AI",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            BlocListener<AiCubit, AiState>(
              listener: (context, state) {
                if (state.isLoading) {
                  showDialog(
                    context: context,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff018CDD),
                      ),
                    ),
                  );
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
              child: Builder(
                builder: (context) {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
                      itemCount:
                          context.watch<AiCubit>().state.chatMessages.length,
                      itemBuilder: (context, index) {
                        return AIBubble(
                          isUser: context
                              .watch<AiCubit>()
                              .state
                              .chatMessages[index]
                              .isUser,
                          message: context
                              .watch<AiCubit>()
                              .state
                              .chatMessages[index]
                              .title,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: AITextField(
          controller: messageController,
        ),
      ),
    );
  }
}




