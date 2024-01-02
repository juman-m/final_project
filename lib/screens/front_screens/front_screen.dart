import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/screens/ai_screens/ai_screen.dart';
import 'package:final_project/screens/auth_screens/widget/button_widget.dart';
import 'package:final_project/screens/documents_screens/documents_screen.dart';
import 'package:final_project/screens/front_screens/notfication_screen.dart';
import 'package:final_project/screens/front_screens/profile_screen.dart';
import 'package:final_project/screens/front_screens/widgets/contener_widget.dart';
import 'package:final_project/screens/front_screens/widgets/location_widget.dart';

import 'package:final_project/screens/my_appointment_screen/my_appointment_screen.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:final_project/screens/teeth_screens/teeth_screen.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/front1.png',
      'assets/front2.png',
      'assets/front3.png',
    ];

    final CarouselSlider carouselSlider = CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1.6,
        viewportFraction: 0.7,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        initialPage: 2,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
      ),
      items: imgList.map((item) {
        return Container(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              item,
              fit: BoxFit.cover,
              width: 400.0,
            ),
          ),
        );
      }).toList(),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff018CDD)),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                      // ClipOval(
                      //   child: Image.asset(
                      //     'assets/image_user.png',
                      //     height: 44,
                      //     width: 44,
                      //   ),
                      // ),
                      const SizedBox(width: 8),
                      Text(
                        'مرحبا,${currentUser!.username}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  ClipOval(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotficationScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/اشعارات.png',
                        height: 44,
                        width: 44,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100, left: 100),
                child: CustomButton(
                  text: ' اسأل AI',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AIScreen(),
                      ),
                    );
                  },
                  leftImage: Image.asset(
                    'assets/AI.png',
                    width: 25,
                  ),
                ),
              ),
              carouselSlider,
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "الخدمات",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceSquareContainer(
                      imagePath: 'assets/cont1.png',
                      serviceName: 'سجلي',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DocumentsScreen(),
                          ),
                        );
                      }),
                  ServiceSquareContainer(
                      imagePath: 'assets/cont2.png',
                      serviceName: 'مواعيدي',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MyAppointmentScreen(isFromHome: true),
                          ),
                        );
                      }),
                  ServiceSquareContainer(
                      imagePath: 'assets/cont3.png',
                      serviceName: 'أسناني',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeethScreen(),
                          ),
                        );
                      }),
                ],
              ),
              const SizedBox(
                height: 11,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text("العيادات القريبة مني",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black)),
              ),
              Container(
                height: 120,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          LocationItemWidget(
                              imagePath: 'assets/5e4baeefe3879 1.png'),
                          SizedBox(
                            width: 40,
                          ),
                          LocationItemWidget(
                              imagePath: 'assets/2022-01-07 (1).png'),
                          SizedBox(
                            width: 25,
                          ),
                          LocationItemWidget(
                              imagePath: 'assets/2022-05-16 (1).jpg')
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: Container(
      //   margin: const EdgeInsets.only(top: 16, left: 16),

      // body: const SizedBox(height: 20),
      floatingActionButton: FloatinCustomm(
        imageUrl: "assets/flot.png",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeethScreen()),
          );
        },
      ),
    );
  }
}
