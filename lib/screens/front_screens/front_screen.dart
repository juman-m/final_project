import 'package:final_project/globals/global.dart';
import 'package:final_project/screens/ai_screens/ai_screen.dart';
import 'package:final_project/screens/auth_screens/widget/button_widget.dart';
import 'package:final_project/screens/front_screens/widgets/contener_widget.dart';
import 'package:final_project/screens/my_appointment_screen/my_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/screens/teeth_screens/teeth_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        autoPlayAnimationDuration: Duration(seconds: 2),
      ),
      items: imgList.map((item) {
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                        style: TextStyle(fontSize: 16),
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
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  "الخدمات",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              SizedBox(
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
                            builder: (context) => MyAppointmentScreen(),
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
                            builder: (context) => TeethScreen(),
                          ),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text("العيادات القريبة مني",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black)),
              )
            ],
          ),
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
