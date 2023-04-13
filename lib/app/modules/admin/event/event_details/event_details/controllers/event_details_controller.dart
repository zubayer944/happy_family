import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/model/event_model.dart';

import '../../../../../../routes/app_pages.dart';
import '../interface/event_details_interface.dart';

class EventDetailsController extends GetxController implements EventDetailsInterface {
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
      Get.snackbar("Successful", "verified Payment");
    });

  }
}
