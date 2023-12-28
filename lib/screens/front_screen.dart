import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/screens/ai_screen.dart';
import 'package:final_project/screens/auth_screens/button_widget.dart';
import 'package:final_project/screens/contener_widget.dart';
import 'package:final_project/screens/my_appointment_screen/my_appointment_screen.dart';
import 'package:final_project/screens/teeth_screens/teeth_screen.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/image_user.png',
                          height: 44,
                          width: 44,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'مرحبا,${currentUser!.username}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  ClipOval(
                    child: Image.asset(
                      'assets/اشعارات.png',
                      height: 44,
                      width: 44,
                    ),
                  ),
                ],
              ),
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
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                "الخدمات",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
                    onPressed: () {}),
                ServiceSquareContainer(
                    imagePath: 'assets/cont2.png',
                    serviceName: 'مواعيدي',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyAppointmentScreen(),
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
              height: 9,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text("العيادات القريبة مني",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black)),
            )
          ],
        ),
      ),
      // floatingActionButton: Container(
      //   margin: const EdgeInsets.only(top: 16, left: 16),

      // body: const SizedBox(height: 20),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 50, left: 16),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeethScreen(),
              ),
            );
          },
          backgroundColor: const Color(0xff018CDD),
          elevation: 2,
          shape: const CircleBorder(),
          child: Image.asset(
            'assets/flot.png',
            height: 80,
            width: 80,
          ),

          // backgroundColor: const Color(0xff018CDD),
          // elevation: 2,
          // shape: const CircleBorder(),
        ),
      ),
    );
  }
}
