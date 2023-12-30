import 'dart:developer';
import 'package:final_project/screens/community_screens/widgets/community_card.dart';
import 'package:final_project/screens/community_screens/widgets/screen_app_bar.dart';
import 'package:final_project/screens/community_screens/widgets/top_row.dart';
import 'package:final_project/screens/create_rate_screen/create_rate_screen.dart';
import 'package:final_project/screens/my_appointment_screens/widgets/fab.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatinCustomm(
        imageUrl: "assets/Vector.png",
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateRateScreen()));
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ScreenAppBar(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TopRow(
                      controller: controller,
                      onTap: () {
                        log('MEOW');
                      }),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 430),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, i) {
                        return CommunityCard(
                          name: 'أنس اشتيوي',
                          time: '8:12 م',
                          content: 'عيادة مسواك شغلهم مرتب ونظيف',
                          onTap: () {
                            log('MEOW');
                          },
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(height: 16);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
