import 'package:final_project/globals/global.dart';
import 'package:final_project/screens/front_screens/profile_screen.dart';

import 'package:flutter/material.dart';

TextEditingController nameController =
    TextEditingController(text: currentUser!.username);
TextEditingController phoneController =
    TextEditingController(text: currentUser!.phone);
TextEditingController emailController =
    TextEditingController(text: currentUser!.email);

class EditProfile extends StatelessWidget {
  const EditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  color: Color(0xff0086D3),
                ),
              ),
              Positioned(
                bottom: 88,
                left: 173,
                child: Container(
                  width: 80,
                  height: 89,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Icons.person,
                    color: Color(0xff0086D3),
                    size: 75,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 21,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                bottom: 25,
                left: 130,
                child: Container(
                  width: 153,
                  height: 39,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                right: 170,
                child: Text(
                  '${currentUser!.username}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: -1,
                child: Image.asset(
                  "assets/Intersect.png",
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                bottom: -40,
                left: -50,
                child: Image.asset(
                  "assets/Ellipse 212.png",
                  width: 160,
                  height: 166,
                ),
              ),
              Positioned(
                bottom: 70,
                right: -28,
                child: Image.asset(
                  "assets/Ellipse 209.png",
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                bottom: 60,
                right: 60,
                child: Image.asset(
                  "assets/Ellipse 211.png",
                  width: 90,
                  height: 50,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'اسم المستخدم',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(19.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Color(0x1481C5E8),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'رقم الجوال',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    fillColor: Color(0x1481C5E8),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الايميل',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Color(0x1481C5E8),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 265,
                height: 59,
                decoration: ShapeDecoration(
                  color: Color(0xFF0086D3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
                child: Center(
                    child: Text(
                  " حفظ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    height: 0.03,
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
