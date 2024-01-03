import 'package:dotted_border/dotted_border.dart';
import 'package:final_project/blocs/documents_bloc/documents_bloc.dart';
import 'package:final_project/models/tooth_model.dart';
import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DocumentsBloc>().add(DocumentsEvent());
    String selectedType = 'أشعة سينية';
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
                  if (index == 0) {
                    selectedType = 'أشعة سينية';
                  } else if (index == 1) {
                    selectedType = 'تقرير';
                  } else if (index == 2) {
                    selectedType = 'وصفة طبية';
                  }
                  context.read<DocumentsBloc>().add(DocumentsEvent());
                },
              ),
            ),
          ),
          height20(),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: BlocBuilder<DocumentsBloc, DocumentsState>(
              builder: (context, state) {
                if (state is DocumentsViewState) {
                  List<Tooth> teethList = [];
                  if (selectedType == "تقرير") {
                    teethList = state.teethListReport;
                  }
                  if (selectedType == 'أشعة سينية') {
                    teethList = state.teethListXray;
                  }
                  if (selectedType == 'وصفة طبية') {
                    teethList = state.teethListPrescription;
                  }
                  return teethList.isNotEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: teethList.length,
                              itemBuilder: (context, index) {
                                return TimelineTile(
                                  axis: TimelineAxis.vertical,
                                  beforeLineStyle:
                                      const LineStyle(thickness: 1),
                                  alignment: TimelineAlign.start,
                                  endChild: DocumentsWidget(
                                      tooth: teethList[index],
                                      type: selectedType),
                                  indicatorStyle: IndicatorStyle(
                                    indicator: DottedBorder(
                                      color: const Color(0xFFD9D9D9),
                                      strokeWidth: 1,
                                      borderType: BorderType.Circle,
                                      child: Center(
                                        child: Container(
                                          width: 9,
                                          height: 9,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    color: const Color(0xFFD9D9D9),
                                  ),
                                  isFirst: index == 0,
                                  isLast: index == teethList.length - 1,
                                );
                              }),
                        )
                      : const Center(child: Text("لا يوجد سجلات"));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentsWidget extends StatelessWidget {
  const DocumentsWidget({
    super.key,
    required this.tooth,
    required this.type,
  });
  final Tooth tooth;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tooth.date!,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF868585),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'رقم السن ${tooth.toothNo}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          height4(),
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: ShapeDecoration(
                  color: colorStatus(tooth.toothStatus!),
                  shape: const OvalBorder(),
                ),
              ),
              width8(),
              Text(
                tooth.toothStatus!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          height8(),
          type == 'أشعة سينية'
              ? InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                          child: SizedBox(
                        height: 500,
                        width: 480,
                        child: Image.network(
                          tooth.xray!,
                          fit: BoxFit.contain,
                        ),
                      )),
                    );
                  },
                  child: Container(
                    width: 270,
                    height: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(tooth.xray!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : type == 'وصفة طبية'
                  ? InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                              child: SizedBox(
                            height: 500,
                            width: 480,
                            child: Image.network(
                              tooth.prescription!,
                              fit: BoxFit.contain,
                            ),
                          )),
                        );
                      },
                      child: Container(
                        width: 270,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(tooth.prescription!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                              child: SizedBox(
                            height: 500,
                            width: 480,
                            child: Image.network(
                              tooth.report!,
                              fit: BoxFit.contain,
                            ),
                          )),
                        );
                      },
                      child: Container(
                        width: 270,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(tooth.report!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}

Color colorStatus(String toothStatus) {
  Color statusColor = Colors.white;
  final List<String> statusList = [
    "جراحة و دواعم",
    "تلبيس",
    "علاج قناة الجذر",
    "خلع",
    "زراعة",
    "حشوة",
    "أكثر من إجراء",
    "أخرى"
  ];

  for (var i = 0; i < statusList.length; i++) {
    if (toothStatus == statusList[0]) {
      statusColor = const Color(0xffCE2164);
    }
    if (toothStatus == statusList[1]) {
      statusColor = const Color(0xff9F571C);
    }
    if (toothStatus == statusList[2]) {
      statusColor = const Color(0xffB322C0);
    }
    if (toothStatus == statusList[3]) {
      statusColor = const Color(0xff393C3E);
    }
    if (toothStatus == statusList[4]) {
      statusColor = const Color(0xff7644CC);
    }
    if (toothStatus == statusList[5]) {
      statusColor = const Color(0xffE91212);
    }
    if (toothStatus == statusList[6]) {
      statusColor = const Color(0xff9C6871);
    }
    if (toothStatus == statusList[7]) {
      statusColor = const Color(0xff0D7E77);
    }
  }
  return statusColor;
}
