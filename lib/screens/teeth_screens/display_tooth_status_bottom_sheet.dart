import 'package:final_project/blocs/teeth_screen_bloc/teeth_screen_bloc.dart';
import 'package:final_project/models/tooth_model.dart';
import 'package:final_project/screens/teeth_screens/teeth_widgets/display_image_widget.dart';
import 'package:final_project/style/size.dart';
import 'package:final_project/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayToothStatusBottomSheet extends StatelessWidget {
  const DisplayToothStatusBottomSheet({
    super.key,
    required this.tooth,
  });
  final Tooth tooth;
  @override
  Widget build(BuildContext context) {
    final TextEditingController hospitalNameController =
        TextEditingController(text: tooth.hospitalName);
    final TextEditingController doctorNameController =
        TextEditingController(text: tooth.doctorName);
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
      height: 570,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'رقم السن ${tooth.toothNo}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${tooth.date}',
                        style: const TextStyle(
                          color: Color(0xFF868585),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                height20(),
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
                  width: 325,
                  height: 38,
                  child: TextField(
                    controller: doctorNameController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE7E6E8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                    ),
                  ),
                ),
                height14(),
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
                  width: 325,
                  height: 38,
                  child: TextField(
                    controller: hospitalNameController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE7E6E8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                    ),
                  ),
                ),
                height34(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 37),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DisplayImageWidget(title: 'وصفة طبية', tooth: tooth),
                      DisplayImageWidget(title: 'تقرير', tooth: tooth),
                      DisplayImageWidget(title: 'أشعة سينية', tooth: tooth),
                    ],
                  ),
                )
              ],
            ),
          ),
          height24(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                      'تعديل ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.05,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                width14(),
                BlocListener<TeethScreenBloc, TeethScreenState>(
                  listener: (context, state) {
                    if (state is TeethDeleteLoadingState) {
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff018CDD),
                          ),
                        ),
                      );
                    }
                    if (state is ToothDeleteErrorState) {
                      Navigator.pop(context);
                      showErrorDialog(context, state.error, "خطأ");
                    }
                    if (state is TeethStatusDeleteState) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      context
                          .read<TeethScreenBloc>()
                          .add(TeethScreenColorsEvent());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            dismissDirection: DismissDirection.up,
                            content: Text(
                              "تم حذف الحالة بنجاح",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Color(0xff018CDD)),
                      );
                    }
                  },
                  child: InkWell(
                    onTap: () async {
                      context
                          .read<TeethScreenBloc>()
                          .add(TeethStatusDeleteEvent(tooth.toothNo!));
                    },
                    child: const Icon(
                      Icons.delete_outline_rounded,
                      color: Color.fromARGB(206, 244, 67, 54),
                      size: 42,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
