
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

// class AITextField extends StatelessWidget {
//   final TextEditingController controller;

//   const AITextField({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           // color: Colors.white,
//           border: Border.all(
//             color: Colors.grey,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 context.read<AiCubit>().sendMessage(controller.text);
//                 controller.clear();
//               },
//               child: Text(
//                 'ارسال',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: TextField(
//                 controller: controller,
//                 decoration: InputDecoration(
//                   // filled: true,
//                   // fillColor: Colors.white,
//                   hintText: 'اكتب الرسالة',
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:final_project/cubits/cubit/ai_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AIBubble extends StatelessWidget {
//   const AIBubble({
//     Key? key,
//     required this.isUser,
//     required this.message,
//   }) : super(key: key);

//   final bool isUser;
//   final String message;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width * 0.75,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: isUser
//                   ? Colors.blue
//                   : const Color.fromARGB(255, 239, 238, 238),
//               borderRadius: BorderRadius.only(
//                 topLeft: const Radius.circular(20),
//                 topRight: const Radius.circular(20),
//                 bottomLeft: isUser
//                     ? const Radius.circular(0)
//                     : const Radius.circular(20),
//                 bottomRight: isUser
//                     ? const Radius.circular(20)
//                     : const Radius.circular(0),
//               ),
//             ),
//             child: Text(
//               message,
//               style: TextStyle(color: isUser ? Colors.white : Colors.black),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class AITextField extends StatelessWidget {
//   final TextEditingController controller;

//   const AITextField({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         TextButton(
//           onPressed: () {
//             context.read<AiCubit>().sendMessage(controller.text);
//             controller.clear();
//           },
//           child: Text(
//             'ارسال',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Expanded(
//           child: TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: 'اكتب الرسالة',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


// class AITextField extends StatelessWidget {
//   final TextEditingController controller;

//   const AITextField({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           icon: Icon(Icons.send),
//           onPressed: () {
//             context.read<AiCubit>().sendMessage(controller.text);

//             controller.clear();
//           },
//         ),
//         Expanded(
//           child: TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: 'اكتب الرسالة',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
