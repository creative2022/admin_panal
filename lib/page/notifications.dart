import 'package:admin_panal/api/messaging.dart';
import 'package:admin_panal/widgets/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(right: 300,left: 300),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'عنوان الإشعار'),
                  ),
                  TextFormField(
                    controller: bodyController,
                    decoration: InputDecoration(labelText: 'محتوى الإشعار'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: sendNotification,
                        child: Text('إرسال الى الكل'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
    
  }

  Future sendNotification() async {
    final response = await Messaging.sendTo(
        title: titleController.text,
        body: bodyController.text,
        fcmToken: "all");
  }
}


