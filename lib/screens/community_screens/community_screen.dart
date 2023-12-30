import 'package:final_project/screens/community_screens/widgets/screen_app_bar.dart';
import 'package:final_project/screens/my_appointment_screens/widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatinCustomm(
        imageUrl: "assets/Vector.png",
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => CreateAppointmentScreen()),
          // );
        },
      ),
      body: Column(
        children: [
          const ScreenAppBar(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          // isDense: true,
                          // isCollapsed: true,
                          // contentPadding: EdgeInsets.only(left: 200, right: 64),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/my-parti.svg',
                      height: 48,
                      width: 48,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
