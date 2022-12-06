import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showNotification() async {
    AndroidNotificationDetails androidNFDetails =
        const AndroidNotificationDetails(
      'bookNF1',
      'Book-Notification',
      priority: Priority.max,
      importance: Importance.max,
    );

    DarwinNotificationDetails iosNFDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notiDetails = NotificationDetails(
      android: androidNFDetails,
      iOS: iosNFDetails,
    );
    await notificationsPlugin.show(
      0,
      'Book Download',
      'Download Completed',
      notiDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pdf downloader'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNotification();
        },
        child: const Icon(Icons.notification_add_outlined),
      ),
    );
  }
}
