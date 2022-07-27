import 'package:admin_panal/api/messaging.dart';
import 'package:admin_panal/utils/background_creative.dart';
import 'package:admin_panal/widgets/message.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      BackgroundCreative(),
      Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(right: 300, left: 300),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'عنوان الإشعار'),
                ),
                TextFormField(
                  controller: bodyController,
                  decoration: const InputDecoration(labelText: 'محتوى الإشعار'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: sendNotification,
                      child: const Text('إرسال الى الكل'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }

  Future sendNotification() async {
    final response = await Messaging.sendTo(
        title: titleController.text,
        body: bodyController.text,
        fcmToken: "all");
  }
}
