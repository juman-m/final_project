import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        backgroundColor: const Color(0xFF0086D3),
        title: const Text(
          "سجلي",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          height30(),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ToggleSwitch(
                radiusStyle: true,
                activeBgColor: const [
                  Color(0xFF008BDB),
                  Color(0xFF008BDB),
                  Color(0xFF008BDB)
                ],
                minWidth: 115,
                minHeight: 47,
                inactiveBgColor: Colors.white,
                initialLabelIndex: 0,
                totalSwitches: 3,
                labels: const ['أشعة سينية', 'تقرير', 'وصفة طبية'],
                onToggle: (index) {
                  // print('switched to: $index');
                },
              ),
            ),
          ),
          height14(),
          // Timeline.tileBuilder(
          //   builder: TimelineTileBuilder.fromStyle(
          //     contentsAlign: ContentsAlign.alternating,
          //     contentsBuilder: (context, index) => Padding(
          //       padding: const EdgeInsets.all(24.0),
          //       child: Text('Timeline Event $index'),
          //     ),
          //     itemCount: 10,
          //   ),
          // ),
          TimelineTile(
            oppositeContents: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(""),
            ),
            contents: Card(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('contents'),
              ),
            ),
            node: const TimelineNode(
              indicator: OutlinedDotIndicator(),
              // startConnector: SolidLineConnector(),
              endConnector: SolidLineConnector(),
            ),
          ),
          TimelineTile(
            oppositeContents: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(""),
            ),
            contents: Card(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('contents2'),
              ),
            ),
            node: const TimelineNode(
              indicator: OutlinedDotIndicator(),
              startConnector: SolidLineConnector(),
              endConnector: SolidLineConnector(),
            ),
          )
        ],
      ),
    );
  }
}
