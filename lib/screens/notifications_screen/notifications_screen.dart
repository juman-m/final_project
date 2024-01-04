import 'package:final_project/functions/noti_scince.dart';
import 'package:final_project/models/notification_model.dart';
import 'package:final_project/screens/common_widgets/custom_app_bar.dart';
import 'package:final_project/screens/front_screens/front_screen.dart';
import 'package:final_project/screens/notifications_screen/widgets/notification_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key, required this.notifications});
  List<NotificationsModel> notifications;

  @override
  Widget build(BuildContext context) {
    notiScince(notifications);
    return Scaffold(
      appBar: customAppBar('الاشعارات', () {
        notifications.clear();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FrontScreen()));
      }, true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            notifications.isEmpty
                ? const Center(
                    child: Text(
                    'لا يوجد إشعارات',
                    style: TextStyle(fontSize: 22, color: Color(0xff869096)),
                  ))
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 64),
                      itemCount: notifications.length,
                      itemBuilder: (context, i) {
                        return NotificationCard(
                          content: notifications[i].content!,
                          since: notifications[i].time!,
                          type: notifications[i].type!,
                          onTap: () {},
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
