import 'package:final_project/models/tooth_model.dart';
import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';

class DisplayImageWidget extends StatelessWidget {
  const DisplayImageWidget({
    super.key,
    required this.title,
    required this.tooth,
  });
  final String title;
  final Tooth tooth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 162,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F9B9A9A),
            blurRadius: 8,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          height10(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          height16(),
          title == 'وصفة طبية'
              ? tooth.prescription != ""
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
                      child: SizedBox(
                          width: 90,
                          height: 90,
                          child: Image.network(
                            tooth.prescription!,
                            fit: BoxFit.contain,
                          )),
                    )
                  : const EmptyImage()
              : title == 'تقرير'
                  ? tooth.report != ""
                      ? InkWell(
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
                          child: SizedBox(
                              width: 90,
                              height: 81,
                              child: Image.network(
                                tooth.report!,
                                fit: BoxFit.contain,
                              )),
                        )
                      : const EmptyImage()
                  : title == 'أشعة سينية'
                      ? tooth.xray != ""
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
                              child: SizedBox(
                                  width: 90,
                                  height: 81,
                                  child: Image.network(
                                    tooth.xray!,
                                    fit: BoxFit.contain,
                                  )),
                            )
                          : const EmptyImage()
                      : const EmptyImage(),
        ],
      ),
    );
  }
}

class EmptyImage extends StatelessWidget {
  const EmptyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 81,
      decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
      child: const Center(
        child: Text(
          'لا يوجد',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFD6D6D6),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
