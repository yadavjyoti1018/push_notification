import 'package:flutter/material.dart';
import 'package:push_notifications_firebase/notification_services.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({super.key});

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  final NotificationServices _notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    _notificationServices.requestNotificationPermission();
    _notificationServices.firebaseInit();
    _notificationServices.isTokenRefreshed();
    _notificationServices.getDeviceToken().then((String token) {
      print('Device token: $token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add your push notification logic here
          },
          child: const Text('Send Push Notification'),
        ),
      ),
    );
  }
}
