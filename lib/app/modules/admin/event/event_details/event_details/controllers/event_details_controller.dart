import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/model/event_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../../common/controller/app_controller.dart';
import '../../../../../../routes/app_pages.dart';
import '../interface/event_details_interface.dart';

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
    },).then((value) {
      sendIndividualMessage();//TODO push notification
      Get.snackbar("Successful", "verified Payment");
    });

  }
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> sendIndividualMessage() async {
    Map<String,String> message = {
      "title" : "This is the message",
      "body": "Here is the description of the message"
    };
    final fcmToken = await firebaseMessaging.getToken();

    try {
      // print('EventDetailsController.sendIndividualMessage<><> ${message.toString()}');
      await firebaseMessaging.sendMessage(
        data: message,
          to: fcmToken);
      print('Message sent successfully');
    } catch (e,s) {
      print('Error sending message: $e');
      print('Error sending message---->>>: $s');
    }
  }

}
