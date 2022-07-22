import 'package:admin_panal/api/messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(150),
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration:const InputDecoration(labelText: 'عنوان الإشعار'),
                ),
                TextFormField(
                  controller: bodyController,
                  decoration:const InputDecoration(labelText: 'محتوى الإشعار'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(

                      onPressed: sendNotification,
                      child: Text('إرسال الإشعار الى الكل'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    
  }
  Future sendNotification() async {
    final response = await Messaging.sendToAll(
        title: titleController.text,
        body: bodyController.text,
      );

  }
}


