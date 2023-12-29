import 'package:flutter/material.dart';

displayDate(
    {required BuildContext context, Function(DateTime?)? onSelected}) async {
  final dateSeleted = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: const Color(0xff5DA7DB),
          colorScheme: const ColorScheme.light(
            primary: Colors.blue,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: Color(0xff5DA7DB),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                const Color(0xff5DA7DB),
              ),
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (onSelected != null) {
    onSelected(dateSeleted);
  }
}
