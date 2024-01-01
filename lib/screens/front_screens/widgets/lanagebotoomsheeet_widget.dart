

import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  _LanguageBottomSheetState createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  bool isCircleFilledArabic = true;
  bool isCircleFilledEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'اختيار اللغة',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    height: 0.04,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'العربية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                    ),
                  ),
                  buildCircleIcon(isCircleFilledArabic),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'English',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                    ),
                  ),
                  buildCircleIcon(isCircleFilledEnglish),
                ],
              ),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget buildCircleIcon(bool filled) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCircleFilledArabic = false;
          isCircleFilledEnglish = false;
          filled = true;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
          color: filled ? Colors.blue : Colors.transparent,
        ),
        child: Icon(
          Icons.circle,
          color: filled ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
