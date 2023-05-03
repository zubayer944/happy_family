import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {

 static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  static final FlutterLocalNotificationsPlugin  notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings initializationSettings = InitializationSettings(
      android:  AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    notificationsPlugin.initialize(
        initializationSettings,
    );
    firebaseNotificationHandler();
  }

  static void createNotification(RemoteMessage message) async {
    try{
      final id = DateTime.now().millisecond ~/1000;
      const NotificationDetails notificationDetails = NotificationDetails(
       android: AndroidNotificationDetails(
        "pushNotification",
        "pushNotificationChannel",
        importance: Importance.max,
        priority: Priority.high,
      ));
      await notificationsPlugin.show(
          id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
      );
    }on Exception catch (e){
      print('LocalNotificationService.createNotification $e');
    }
  }

  static void firebaseNotificationHandler() async{
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print(
            'AppController.firebaseNotificationHandler title----->>${message.notification?.title}');
        print(
            'AppController.firebaseNotificationHandler body----->>${message.notification?.body}');

        LocalNotificationService.createNotification(message);
      }// Handle foreground message here
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('AppController.firebaseNotificationHandler 2-----> ${message.data.toString()}');
    });
  }

  void initFirebaseBackgroundMsg() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // Handle background message here
    print('AppController._firebaseMessagingBackgroundHandler 3---->>> ${message.data.values.toString()}');
  }
}