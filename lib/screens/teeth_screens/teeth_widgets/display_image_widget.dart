// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:final_project/blocs/add_tooth_status_bloc/add_tooth_status_bloc.dart';
import 'package:final_project/blocs/teeth_screen_bloc/teeth_screen_bloc.dart';
import 'package:final_project/models/tooth_model.dart';
import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayImageWidget extends StatelessWidget {
  DisplayImageWidget({
    super.key,
    required this.title,
    required this.tooth,
    this.changeReport,
    this.changeXRay,
    this.changePrescription,
  });
  final String title;
  final Tooth tooth;
  Function(String)? changeReport;
  Function(String)? changeXRay;
  Function(String)? changePrescription;
  @override
  Widget build(BuildContext context) {
    bool report = false;
    bool xRay = false;
    bool prescription = false;
    return Stack(
      children: [
        BlocConsumer<AddToothStatusBloc, AddToothStatusState>(
          listener: (context, state) {
            if (state is ImageUpdateState) {
              if (state.image != null) {
                if (state.xRay == true) {
                  tooth.xray = state.image;
                  xRay = state.xRay;
                  context.read<TeethScreenBloc>().isEditXray = true;
                  // changeXRay!(state.image!);
                } else if (state.report == true) {
                  tooth.report = state.image;
                  report = state.report;
                  context.read<TeethScreenBloc>().isEditReport = true;
                  // changeReport!(state.image!);
                } else if (state.prescription == true) {
                  tooth.prescription = state.image;
                  prescription = state.prescription;
                  context.read<TeethScreenBloc>().isEditPrescription = true;
                  // changePrescription!(state.image!);
                }
              }
            }
          },
          builder: (context, state) {
            if (state is ImageUpdateState) {
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
                            ? prescription
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Center(
                                            child: SizedBox(
                                                height: 500,
                                                width: 480,
                                                child: Image.file(
                                                  File(tooth.prescription!),
                                                  fit: BoxFit.cover,
                                                ))),
                                      );
                                    },
                                    child: SizedBox(
                                        width: 90,
                                        height: 90,
                                        child: Image.file(
                                          File(tooth.prescription!),
                                          fit: BoxFit.cover,
                                        )),
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
                                ? report
                                    ? InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Center(
                                                child: SizedBox(
                                                    height: 500,
                                                    width: 480,
                                                    child: Image.file(
                                                      File(tooth.report!),
                                                      fit: BoxFit.cover,
                                                    ))),
                                          );
                                        },
                                        child: SizedBox(
                                            width: 90,
                                            height: 81,
                                            child: Image.file(
                                              File(tooth.report!),
                                              fit: BoxFit.cover,
                                            )),
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
                                        child: SizedBox(
                                            width: 90,
                                            height: 90,
                                            child: Image.network(
                                              tooth.report!,
                                              fit: BoxFit.contain,
                                            )),
                                      )
                                : const EmptyImage()
                            : title == 'أشعة سينية'
                                ? tooth.xray != ""
                                    ? xRay
                                        ? InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) => Center(
                                                    child: SizedBox(
                                                        height: 500,
                                                        width: 480,
                                                        child: Image.file(
                                                          File(tooth.xray!),
                                                          fit: BoxFit.cover,
                                                        ))),
                                              );
                                            },
                                            child: SizedBox(
                                                width: 90,
                                                height: 81,
                                                child: Image.file(
                                                  File(tooth.xray!),
                                                  fit: BoxFit.cover,
                                                )),
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
                                                    tooth.xray!,
                                                    fit: BoxFit.contain,
                                                  ),
                                                )),
                                              );
                                            },
                                            child: SizedBox(
                                                width: 90,
                                                height: 90,
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
          },
        ),
        Positioned(
            bottom: 6,
            right: 8,
            child: InkWell(
              onTap: () {
                context.read<AddToothStatusBloc>().add(UpdateImageEvent(title));
              },
              child: const Icon(
                Icons.edit,
                size: 20,
                color: Color.fromARGB(214, 158, 158, 158),
              ),
            )),
      ],
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
