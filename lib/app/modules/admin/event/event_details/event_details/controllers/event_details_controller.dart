import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/model/event_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../../common/controller/app_controller.dart';
import '../../../../../../model/user_model.dart';
import '../../../../../../routes/app_pages.dart';
import '../interface/event_details_interface.dart';
import 'package:http/http.dart' as http;
class EventDetailsController extends GetxController implements EventDetailsInterface {
  final AppController appController = Get.find();

  EventModel eventModel = EventModel();
  late String id;
  @override
  void onInit() {
    id = Get.arguments['id'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onPopupAppBarIconClicked(String result) {
    if(result == "add_payment"){
      Get.toNamed(Routes.TOTAL_COST,arguments: {"id": id});
    }
  }

  @override
  void onIsVerifiedBtn(bool value,bookedUserInfo) {
    CollectionReference eventCollection =
    FirebaseFirestore.instance.collection('events');

    eventModel.bookedUserInfo?[eventModel.bookedUserInfo!.indexOf(bookedUserInfo)].verifiedPayment = value;
    final list = eventModel.bookedUserInfo?.map((e) {
      return e.toJson();}).toList();
    eventCollection.doc(id).update({
      "bookedUserInfo": list,
    },).then((response) {
      sendIndividualMessage(bookedUserInfo.userId,value);//TODO push notification
      Get.snackbar("Successful", "verified Payment");
    });

  }
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> sendIndividualMessage(String? userId, bool paymentStatus, ) async {

    print('EventDetailsController.sendIndividualMessage userId: $userId');

    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');
    usersCollection.doc(userId).get().then((DocumentSnapshot value) async {
      UserModel userModel = UserModel.fromJson(value.data() as Map<String,dynamic>);
      userModel.userId = value.id;
      print('EventDetailsController.sendIndividualMessage pushToken: ${userModel.pushToken}');

      if((userModel.pushToken ?? "").isNotEmpty){
        try {
          String serverToken = "AAAAhq9r9Uk:APA91bGXTymnZP2R1g1zz5yAI9ChUdQ9JpUBVR1izVHUoyIVq-k26UIwNi6uPnox0TpNRU18UcUygtE14hLavKz1CASrYn6FMFPigWB7neou0TuWo7OSoIt8WPN20Tup6LzWz4BH-cGx";
          var result = await http.post(
            Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'key=$serverToken',
            },
            body: jsonEncode(
              <String, dynamic>{
                'notification': <String, dynamic>{
                  'title':paymentStatus?  'Your payment is success 😎' :'Your payment is declined 😭',
                      'body': paymentStatus? 'Congratulation 😎😎😎 your payment received successfully,Stay connected' : "Sorry 😭😭😭 Your payment is failed, Please contact with admin",
                },
                'priority': 'high',
                'to': userModel.pushToken,
              },
            ),
          );
          print('Message sent successfully');
          print('EventDetailsController.sendIndividualMessage StatusCode------> ${result.statusCode}');
        } catch (e, s) {
          print('Error sending message:-<><> $e');
          print('Error sending message---->>>: $s');
        }
      }else{
        print('EventDetailsController.sendIndividualMessage ----<><><>Token is empty');
      }
    }).onError((error, stackTrace){
      Get.snackbar("Error", "$error");
      print('EventDetailsController.sendIndividualMessage --->>>>$error');
      print('EventDetailsController.sendIndividualMessage error---<><> : $stackTrace');
    });



  }

}
