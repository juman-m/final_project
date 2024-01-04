import 'package:final_project/globals/global.dart';
import 'package:final_project/screens/auth_screens/signin_screen.dart';
import 'package:final_project/screens/front_screens/edit_profile.dart';
import 'package:final_project/screens/front_screens/widget_profile.dart';
import 'package:final_project/screens/front_screens/widgets/bottomsheet_widget.dart';
import 'package:final_project/screens/front_screens/widgets/lanagebotoomsheeet_widget.dart';
import 'package:final_project/screens/my_participation_screen/my_participation_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
          child: Stack(children: [
            Positioned(
              bottom: 88,
              left: 173,
              child: Container(
                width: 80,
                height: 89,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.person,
                  color: Color(0xff0086D3),
                  size: 75,
                ),
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
                top: 190,
                right: 120,
                child: Container(
                    width: 27,
                    height: 26,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 2,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Color(0xff0086D3),
                        size: 20,
                      ),
                    ))),
            Positioned(
              top: 200,
              right: 165,
              child: Text(
                '${currentUser!.username}',
                textAlign: TextAlign.right,
                style: const TextStyle(
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
            Positioned(
              top: 60,
              right: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              // bottom: 160,
              top: 60,
              left: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                  size: 33,
                  color: Colors.white,
                ),
                onPressed: () {
                  final supabase = Supabase.instance.client;
                  supabase.auth.signOut();
                  currentUser = null;
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                      (route) => false);
                },
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 40,
        ),
        CustomContainer(
            leftIcon: Icons.topic_rounded,
            leftText: 'مشاركاتي',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyParticipationsScreen(),
                ),
              );
            }),
        const SizedBox(
          height: 25,
        ),
        CustomContainer(
          leftIcon: Icons.notifications_active_outlined,
          leftText: 'الإشعارات',
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return NotificationBottomSheet();
              },
            );
          },
        ),
        const SizedBox(
          height: 25,
        ),
        CustomContainer(
          leftIcon: Icons.language,
          leftText: 'اللغة',
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (BuildContext context) {
                return LanguageBottomSheet();
              },
            );
          },
        ),
        const SizedBox(
          height: 25,
        ),
        const CustomContainer(
          leftIcon: Icons.star_outline_sharp,
          leftText: 'قيٌم التطبيق',
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 265,
          height: 59,
          decoration: ShapeDecoration(
            color: const Color(0xFF0086D3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                  child: Text(
                "ادع أصدقائك",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  height: 0.03,
                ),
              )),
              SizedBox(
                width: 46,
              ),
              Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
