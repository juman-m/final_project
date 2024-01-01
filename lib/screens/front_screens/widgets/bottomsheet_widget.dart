import 'package:flutter/material.dart';

class NotificationBottomSheet extends StatefulWidget {
  @override
  State<NotificationBottomSheet> createState() =>
      _NotificationBottomSheetState();
}

class _NotificationBottomSheetState extends State<NotificationBottomSheet> {
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;
  bool switchValue4 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الإشعارت',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                    ),
                  ),
                  buildSwitchRow(switchValue4, (value) {
                    setState(() {
                      switchValue4 = value;
                    });
                  }),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'العروض',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                    ),
                  ),
                  buildSwitchRow(switchValue1, (value) {
                    setState(() {
                      switchValue1 = value;
                    });
                  }),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المواعيد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                    ),
                  ),
                  buildSwitchRow(switchValue2, (value) {
                    setState(() {
                      switchValue2 = value;
                    });
                  }),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجتمع',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                    ),
                  ),
                  buildSwitchRow(switchValue3, (value) {
                    setState(() {
                      switchValue3 = value;
                    });
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildSwitchRow(bool switchValue, Function(bool) onChanged) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Switch(
        value: switchValue,
        onChanged: onChanged,
        activeColor: switchValue ? Colors.blue : null,
      ),
    ],
  );
}