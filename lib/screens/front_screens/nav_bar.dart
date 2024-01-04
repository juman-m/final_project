import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:final_project/screens/community_screens/community_screen.dart';
import 'package:final_project/screens/front_screens/front_screen.dart';
import 'package:final_project/screens/my_appointment_screen/my_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int selected = 1;

  List<Widget> screens = [
    const MyAppointmentScreen(),
    const FrontScreen(),
    const CommunityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selected],
      bottomNavigationBar: CrystalNavigationBar(
        backgroundColor: const Color(0xFFEFEFEF),
        currentIndex: selected,
        selectedItemColor: const Color(0xFF008CDC),
        unselectedItemColor: const Color(0xFF869096),
        onTap: (int i) {
          setState(() {
            selected = i;
          });
        },
        items: [
          CrystalNavigationBarItem(
            icon: Icons.date_range,
            selectedColor: const Color(0xFF008CDC),
          ),
          CrystalNavigationBarItem(
            icon: Icons.home,
            selectedColor: const Color(0xFF008CDC),
          ),
          CrystalNavigationBarItem(
            icon: (FontAwesome.users_solid),
            selectedColor: const Color(0xFF008CDC),
          ),
        ],
      ),
    );
  }
}

