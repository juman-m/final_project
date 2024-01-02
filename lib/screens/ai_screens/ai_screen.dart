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

                  // Image.asset(
                  //   "assets/AI (2).png",
                  //   width: 50.0,
                  // ),
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

            // BlocBuilder<AiCubit, AiState>(
            //   builder: (context, state) {
            //     if (state.isLoading) {
            //       return const Center(
            //         child: CircularProgressIndicator(color: Color(0xff018CDD)),
            //       );
            //     } else {
            //       return ListView.builder(
            //         padding: const EdgeInsets.only(bottom: 100),
            //         itemCount: state.chatMessages.length,
            //         itemBuilder: (context, index) {
            //           return AIBubble(
            //             isUser: state.chatMessages[index].isUser,
            //             message: state.chatMessages[index].title,
            //           );
            //         },
            //       );
            //     }
            //   },
            // ),
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




// import 'package:final_project/cubits/cubit/ai_cubit.dart';
// import 'package:final_project/cubits/cubit/ai_state.dart';
// import 'package:final_project/screens/ai_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AIScreen extends StatelessWidget {
//   final TextEditingController messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final aiCubit = context.read<AiCubit>();

//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.close),
//         title: Text('AI '),
//       ),
//       //  ClipRRect(
//       //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//       //     child: Padding(
//       //       padding: const EdgeInsets.only(right: 10.0),
//       //       child: Image.asset(
//       //         "assets/AI (2).png",
//       //         width: 700.0,
//       //       ),
//       //     ),
//       //   ),
//       bottomSheet: AITextField(
//         controller: messageController,
//       ),
//       body: BlocBuilder<AiCubit, AiState>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return ListView.builder(
//               padding: const EdgeInsets.only(bottom: 100),
//               itemCount: state.chatMessages.length,
//               itemBuilder: (context, index) {
//                 return AIBubble(
//                   isUser: state.chatMessages[index].isUser,
//                   message: state.chatMessages[index].title,
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
// import 'package:final_project/cubits/cubit/ai_cubit.dart';
// import 'package:final_project/cubits/cubit/ai_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class OpenAiScreen extends StatefulWidget {
//   @override
//   State<OpenAiScreen> createState() => _OpenAiScreenState();
// }

// class _OpenAiScreenState extends State<OpenAiScreen> {
//   TextEditingController controllerAsk = TextEditingController();
//   bool isTextFieldEmpty = true;

//   @override
//   Widget build(BuildContext context) {
//     //final ChatCubit chatCubit = context.read<ChatCubit>();

//     return Scaffold(
//       backgroundColor: Colors.green[50],
//       appBar: AppBar(
//         backgroundColor: Colors.green[50],
//         // flexibleSpace: Container(
//         //   decoration: BoxDecoration(
//         //     gradient: LinearGradient(colors: [
//         //       Color.fromARGB(255, 141, 220, 154),
//         //       Color.fromARGB(255, 159, 222, 182),
//         //     ]),
//         //   ),
//         // ),
//         centerTitle: true,
//         title: const Text(
//           'ChatGpt For Expo',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: SafeArea(
//           child: BlocBuilder<AiCubit, AiState>(
//             builder: (context, state) {
//               return Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Expanded(
//                         child: ListView.builder(
//                           reverse: true,
//                           itemCount: state.chatMessages.length,
//                           itemBuilder: (context, index) {
//                             return ChatMessageWidget(
//                               title: state.chatMessages[index].title,
//                               isUser: state.chatMessages[index].isUser,
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Flexible(
//                                 flex: 4,
//                                 child: TextField(
//                                   controller: controllerAsk,
//                                   onChanged: (text) {
//                                     setState(() {
//                                       isTextFieldEmpty = text.isEmpty;
//                                     });
//                                   },
//                                   decoration: const InputDecoration(
//                                     hintText: 'Curious about the best?',
//                                     hintStyle: TextStyle(color: Colors.black),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 159, 200, 222),
//                                       ),
//                                     ),
//                                     contentPadding: EdgeInsets.only(left: 10),
//                                   ),
//                                 ),
//                               ),
//                               AnimatedSwitcher(
//                                 duration: Duration(milliseconds: 300),
//                                 child: isTextFieldEmpty
//                                     ? Container()
//                                     : IconButton(
//                                         key: Key('send_icon'),
//                                         icon: Icon(Icons.send,
//                                             color: Colors.black),
//                                         onPressed: isTextFieldEmpty
//                                             ? null
//                                             : () {
//                                                 context
//                                                     .read<AiCubit>()
//                                                     .sendMessage(
//                                                         controllerAsk.text);

//                                                 controllerAsk.clear();
//                                               },
//                                       ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   if (state.isLoading)
//                     Container(
//                       color: Colors.black.withOpacity(0.5),
//                       child: Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChatMessageWidget extends StatelessWidget {
//   const ChatMessageWidget({Key? key, required this.title, required this.isUser})
//       : super(key: key);

//   final String title;
//   final bool isUser;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         child: Text(
//           title,
//           style: TextStyle(color: Colors.black),
//         ),
//         padding: EdgeInsets.all(8),
//         margin: isUser
//             ? EdgeInsets.only(top: 16, right: 4, left: 25)
//             : EdgeInsets.only(top: 16, left: 4, right: 25),
//         alignment: Alignment.center,
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: isUser
//               ? Color.fromARGB(255, 141, 220, 154)
//               : Color.fromARGB(255, 129, 182, 148),
//         ),
//       ),
//     );
//   }
// }
