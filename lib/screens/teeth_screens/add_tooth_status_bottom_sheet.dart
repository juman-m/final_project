import 'package:final_project/blocs/add_tooth_status_bloc/add_tooth_status_bloc.dart';
import 'package:final_project/blocs/date_picker_bloc/date_piker_bloc.dart';
import 'package:final_project/blocs/status_chip_bloc/status_chip_bloc.dart';
import 'package:final_project/screens/teeth_screens/date_picker.dart';
import 'package:final_project/screens/teeth_screens/status_chip_widget.dart';
import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddToothStatusBottomSheet extends StatelessWidget {
  const AddToothStatusBottomSheet({
    super.key,
    required this.toothNum,
  });
  final String toothNum;

  @override
  Widget build(BuildContext context) {
    final chipStatusBloc = context.read<StatusChipBloc>();
    final TextEditingController hospitalNameController =
        TextEditingController();
    final TextEditingController doctorNameController = TextEditingController();
    String selectedDate = "";
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
    final List<Color> statusColorList = [
      const Color(0xFFCD2164),
      const Color(0xFF9F561B),
      const Color(0xFFB321BF),
      const Color(0xFF393C3E),
      const Color(0xFF7643CB),
      const Color(0xFFE91111),
      const Color(0xFF9B6771),
      const Color(0xFF0D7E77),
    ];
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      height: 640,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height14(),
          Center(
            child: Container(
              width: 120,
              height: 5,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 3),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 29.05,
                decoration: const ShapeDecoration(
                  color: Color(0xFFE7E6E8),
                  shape: OvalBorder(),
                ),
                child: const Icon(
                  Icons.clear,
                  size: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 19.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 19, left: 53),
                  child: Text(
                    'رقم السن $toothNum',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                height14(),
                Row(
                  children: [
                    const Text(
                      'التاريخ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    width10(),
                    Container(
                      width: 141,
                      height: 34,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFFC8C8C8)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: BlocListener<DatePikerBloc, DatePikerState>(
                        listener: (context, state) {
                          if (state is DatePickerUpdated) {
                            selectedDate =
                                "${state.pickedDate.year}-${state.pickedDate.month}-${state.pickedDate.day}";
                          }
                        },
                        child: BlocBuilder<DatePikerBloc, DatePikerState>(
                          builder: (context, state) {
                            if (state is DatePickerUpdated) {
                              return InkWell(
                                onTap: () async {
                                  displayDate(
                                      context: context,
                                      onSelected: (value) {
                                        if (value != null) {
                                          context
                                              .read<DatePikerBloc>()
                                              .add(DatePicked(value));
                                        }
                                      });
                                },
                                child: Center(
                                    child: Text(
                                  "${state.pickedDate.year}-${state.pickedDate.month}-${state.pickedDate.day}",
                                  style: const TextStyle(
                                    color: Color(0xFFC5C5C5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                              );
                            } else {
                              return InkWell(
                                onTap: () {
                                  displayDate(
                                      context: context,
                                      onSelected: (value) {
                                        if (value != null) {
                                          context
                                              .read<DatePikerBloc>()
                                              .add(DatePicked(value));
                                        }
                                      });
                                },
                                child: const Center(
                                  child: Text(
                                    'DD/MM/YY',
                                    style: TextStyle(
                                      color: Color(0xFFC5C5C5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
                height14(),
                SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(right: 4, left: 12),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: statusList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<StatusChipBloc>()
                              .add(SelectChipEvent(statusList[index]));
                          chipStatusBloc.selectedStatus = statusList[index];
                        },
                        child: BlocBuilder<StatusChipBloc, StatusChipState>(
                          builder: (context, state) {
                            if (state is StatusChipChangeState) {
                              return StatusChip(
                                title: statusList[index],
                                color: statusColorList[index],
                                background: chipStatusBloc.selectedStatus ==
                                        statusList[index]
                                    ? const Color.fromARGB(255, 154, 154, 154)
                                    : const Color(0xFFEEEEEE),
                                text: chipStatusBloc.selectedStatus ==
                                        statusList[index]
                                    ? Colors.white
                                    : Colors.black,
                              );
                            }
                            return StatusChip(
                              title: statusList[index],
                              color: statusColorList[index],
                              background: chipStatusBloc.selectedStatus ==
                                      statusList[index]
                                  ? const Color.fromARGB(255, 154, 154, 154)
                                  : const Color(0xFFEEEEEE),
                              text: chipStatusBloc.selectedStatus ==
                                      statusList[index]
                                  ? Colors.white
                                  : Colors.black,
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return width10();
                    },
                  ),
                ),
                height16(),
                const Text(
                  'اسم الدكتور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                height10(),
                SizedBox(
                  width: 330,
                  height: 38,
                  child: TextField(
                    controller: hospitalNameController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.50, color: Color(0xFFC8C8C8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.80,
                            color: Color.fromARGB(255, 154, 153, 153)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                    ),
                  ),
                ),
                height10(),
                const Text(
                  'اسم المستشفى',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                height10(),
                SizedBox(
                  width: 330,
                  height: 38,
                  child: TextField(
                    controller: doctorNameController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.50, color: Color(0xFFC8C8C8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0.80,
                            color: Color.fromARGB(255, 154, 153, 153)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                    ),
                  ),
                ),
                height14(),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 350,
              height: 47,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3FC8C8C8),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
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
                  print('switched to: $index');
                },
              ),
            ),
          ),
          height14(),
          Padding(
            padding: const EdgeInsets.only(
              right: 27.0,
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 330,
                height: 111,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFC8C8C8)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Color(0xffC7C7C8),
                      ),
                      Text(
                        'تحميل الصورة',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFC6C7C7),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          height20(),
          Center(
            child: BlocListener<AddToothStatusBloc, AddToothStatusState>(
              listener: (context, state) {
                if (state is AddStatusLoadingState) {
                  showDialog(
                    context: context,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff018CDD),
                      ),
                    ),
                  );
                }
                if (state is ToothStatusErrorState) {
                  Navigator.pop(context);
                  showErrorDialog(context, state.error, "خطأ");
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //       behavior: SnackBarBehavior.floating,
                  //       margin: EdgeInsets.only(
                  //         bottom: MediaQuery.of(context).size.height - 200,
                  //         left: 10,
                  //         right: 10,
                  //       ),
                  //       content: Text(
                  //         state.error,
                  //         style: const TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //       backgroundColor: const Color(0xff018CDD)),
                  // );
                }
                if (state is ToothStatusAddedState) {
                  Navigator.pop(context);

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        dismissDirection: DismissDirection.up,
                        content: Text(
                          "تم إضافة الحالة بنجاح",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Color(0xff018CDD)),
                  );
                }
              },
              child: InkWell(
                onTap: () {
                  final userId = Supabase.instance.client.auth.currentUser!.id;

                  context.read<AddToothStatusBloc>().add(AddToothStatusEvent(
                      userId,
                      toothNum,
                      chipStatusBloc.selectedStatus,
                      hospitalNameController.text,
                      doctorNameController.text,
                      "prescription",
                      "xray",
                      "report",
                      selectedDate));
                },
                child: Container(
                  width: 243.61,
                  height: 47.88,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF008BDB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.02),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'حفظ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void showErrorDialog(BuildContext context, String errorMessage, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xff018CDD)),
        ),
        content: Text(errorMessage),
        backgroundColor: Colors.white,
      );
    },
  );

  // Close the dialog automatically after two seconds
  Future.delayed(const Duration(seconds: 1), () {
    Navigator.of(context).pop();
  });
}
