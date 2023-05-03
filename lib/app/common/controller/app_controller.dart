import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/local_notification_service/local_notification_service.dart';

import '../../model/user_model.dart';

class AppController extends GetxController {



  Rx<UserModel> userModel = UserModel().obs;
   late String fcmTokenId;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;



  void startUserSnapshot(String docId) {
    var documentStream = FirebaseFirestore.instance.collection('users').doc(docId).snapshots().listen((DocumentSnapshot<Map<String, dynamic>> event) {
      userModel.value = UserModel.fromJson(event.data()!);
      userModel.value.userId = docId;
      userModel.refresh();

    });
  }

  @override
  void onInit() async{

     fcmTokenId = await (FirebaseMessaging.instance.getToken()) ?? "";
     // firebaseNotificationHandler();

    super.onInit();
  }

  // void firebaseNotificationHandler() async{
  //   _firebaseMessaging.requestPermission();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     if (message.notification != null) {
  //       print(
  //           'AppController.firebaseNotificationHandler title----->>${message.notification?.title}');
  //       print(
  //           'AppController.firebaseNotificationHandler body----->>${message.notification?.body}');
  //
  //       LocalNotificationService.createNotification(message);
  //     }// Handle foreground message here
  //   });
  //
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('AppController.firebaseNotificationHandler 2-----> ${message.data.toString()}');
  //   });
  // }
  //
  // void initFirebaseBackgroundMsg() async {
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  // }
  //
  // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   // Handle background message here
  //   print('AppController._firebaseMessagingBackgroundHandler 3---->>> ${message.data.values.toString()}');
  // }


}