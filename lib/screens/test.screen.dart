import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Text("data")
    );
  }
}

// tooth.prescription != ""
//               ? SizedBox(
//                   width: 90,
//                   height: 90,
//                   child: Image.network(
//                     tooth.prescription!,
//                     fit: BoxFit.contain,
//                   ))
//               : tooth.report != ""
//                   ? SizedBox(
//                       width: 90,
//                       height: 81,
//                       child: Image.network(
//                         tooth.report!,
//                         fit: BoxFit.contain,
//                       ))
//                   : tooth.xray != ""
//                       ? SizedBox(
//                           width: 90,
//                           height: 81,
//                           child: Image.network(
//                             tooth.xray!,
//                             fit: BoxFit.contain,
//                           ))
//                       : Container(
//                           width: 75,
//                           height: 81,
//                           decoration:
//                               const BoxDecoration(color: Color(0xFFF8F8F8)),
//                           child: const Center(
//                             child: Text(
//                               'لا يوجد',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color(0xFFD6D6D6),
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),