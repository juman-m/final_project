import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:final_project/screens/front_screen.dart';
import 'package:final_project/screens/my_appointment_screen/my_appointment_screen.dart';
import 'package:final_project/screens/test.screen.dart';
import 'package:flutter/material.dart';

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
    const MyWidget(),
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
            icon: Icons.people,
            selectedColor: const Color(0xFF008CDC),
          ),
        ],
      ),
    );
  }
}

// import 'package:capstone_2/screens/fortest.dart';
// import 'package:capstone_2/screens/home_screen/home_screen.dart';

// import 'package:flutter/material.dart';
// import 'package:dot_navigation_bar/dot_navigation_bar.dart';

// class AppNavigationBar extends StatefulWidget {
//   const AppNavigationBar({Key? key}) : super(key: key);

//   @override
//   State<AppNavigationBar> createState() => _AppNavigationBarState();
// }

// class _AppNavigationBarState extends State<AppNavigationBar> {
//   int selected = 0;

//   List screen = [
//     ForTest(),
//     HomeScreen(),
//     HomeScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screen[selected],
//       floatingActionButton: DotNavigationBar(
//         backgroundColor: Color(0xFFEFEFEF),
//         currentIndex: selected,
//         unselectedItemColor: Color(0xFF869096),
//         onTap: (int i) {
//           setState(() {
//             selected = i;
//           });
//         },
//         items: [
//           DotNavigationBarItem(
//             icon: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.home),
//                 Text('المجتمع'),
//               ],
//             ),
//             selectedColor: Color(0xFF008CDC),
//           ),
//           DotNavigationBarItem(
//             icon: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.show_chart),
//                 Text('الرئيسية'),
//               ],
//             ),
//             selectedColor: Color(0xFF008CDC),
//           ),
//           DotNavigationBarItem(
//             icon: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.chat_bubble),
//                 Text('المواعيد'),
//               ],
//             ),
//             selectedColor: Color(0xFF008CDC),
//           ),
//         ],
//         itemPadding: EdgeInsets.symmetric(vertical: 5.0),
//       ),
//     );
//   }
// }
// import 'package:capstone_2/screens/auth_screens/signin_screen.dart';
// import 'package:capstone_2/screens/home_screen/home_screen.dart';
// import 'package:capstone_2/screens/welcome_screen.dart';
// import 'package:dot_navigation_bar/dot_navigation_bar.dart';
// import 'package:flutter/material.dart';

// class AppNavigationBar extends StatefulWidget {
//   const AppNavigationBar({
//     super.key,
//   });

//   @override
//   State<AppNavigationBar> createState() => _AppNavigationBarState();
// }

// class _AppNavigationBarState extends State<AppNavigationBar> {
//   var _selectedTab = _SelectedTab.home;
//   int index = 0;
//   List screen = [
//     HomeScreen(),
//     SignInScreen(),
//     WelcomeScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBody: true,
//         body: screen[index],
//         bottomNavigationBar: DotNavigationBar(
//           backgroundColor: Colors.grey.withOpacity(0.4),
//           currentIndex: _SelectedTab.values.indexOf(_selectedTab),
//           unselectedItemColor: Colors.grey,
//           onTap: (int i) {
//             setState(() {
//               index = i;
//               _selectedTab = _SelectedTab.values[i];
//             });
//           },
//           items: [
//             DotNavigationBarItem(
//               icon: const Icon(Icons.home),
//               selectedColor: Colors.amber,
//             ),
//             DotNavigationBarItem(
//               icon: const Icon(Icons.add),
//               selectedColor: Colors.amber,
//             ),
//             DotNavigationBarItem(
//               icon: const Icon(Icons.person_2_outlined),
//               selectedColor: Colors.amber,
//             ),
//           ],
//         ));
//   }
// }

// enum _SelectedTab { home, addInformation, users, profail }
