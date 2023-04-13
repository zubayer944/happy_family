import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/model/event_model.dart';

import '../../../../../common/controller/app_controller.dart';
import '../../../../../common/values/my_colors.dart';
import '../../../../../routes/app_pages.dart';
import '../interface/send_request_view_interface.dart';

class SendRequestViewController extends GetxController implements SendRequestViewInterface{

  final AppController appController = Get.find();
  late EventModel eventMode;
  @override
  void onInit() {
    eventMode = Get.arguments["event"];
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
  void onSendRequestForMoneyPressed(EventModel eventModel) {
    if( (eventModel.bookedUserInfo ?? []).where((element) => element.userId == appController.userModel.value.userId).isEmpty){
      Get.toNamed(Routes.USER_PACKAGE_DETAILS,arguments:{"event": eventModel});
    }else {
      Get.snackbar("Please wait for booking confirmation!!!", "Already Booked this event",backgroundColor: MyColors.amberColor,);
    }
  }

  @override
  void onPopupAppBarIconClicked(String value) {
    CollectionReference eventCollection =
    FirebaseFirestore.instance.collection('events');
    if(value == "delete"){
      BookedUserInfo? bookedUserInfo;
      for(BookedUserInfo userInfo in eventMode.bookedUserInfo ?? []){
        if(userInfo.userId == appController.userModel.value.userId){
          bookedUserInfo = userInfo;
          break;
        }
      }
      if(bookedUserInfo != null){

        eventCollection.doc(eventMode.documentId).update({"bookedUserInfo":FieldValue.arrayRemove([bookedUserInfo.toJson()])}).onError((error, stackTrace){
          Get.snackbar("Failed", "$error");
          print('SendRequestViewController.onPopupAppBarIconClicked error : $stackTrace');
        });
        eventCollection.doc(eventMode.documentId).update({
          "totalBookedAdultCount": FieldValue.increment(-(bookedUserInfo.totalAdult ?? 0)),
          "totalBookedChildrenCount": FieldValue.increment(-(bookedUserInfo.totalChildren ?? 0)),
          "totalBookedUniqueCount": FieldValue.increment(-1),
        });

      }
    }
  }
}
