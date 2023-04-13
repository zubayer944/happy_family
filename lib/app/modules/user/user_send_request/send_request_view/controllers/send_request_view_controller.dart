import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/model/event_model.dart';

import '../../../../../common/controller/app_controller.dart';
import '../../../../../common/values/my_colors.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../admin/total_cost/all_users/models/debit_credit_model.dart';
import '../interface/send_request_view_interface.dart';

class SendRequestViewController extends GetxController implements SendRequestViewInterface{

  final AppController appController = Get.find();
  Rx<EventModel> eventMode = EventModel().obs;
  RxList<DebitCreditModel> eventList = <DebitCreditModel>[].obs;

  Rx<int> totalDebitPrice = 0.obs;
  Rx<int> totalCreditPrice = 0.obs;

  @override
  void onInit() {
    eventMode.value = Get.arguments["event"];

    _initSnapshot();

    _initDebitCreditSnapshot();

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

  void _initSnapshot() {
    FirebaseFirestore.instance.collection('events').doc(eventMode.value.documentId).snapshots().listen((DocumentSnapshot<Map<String, dynamic>> event) {
      EventModel eventModel = EventModel.fromJson(event.data() as Map<String,dynamic>);
      eventModel.documentId = event.id;

      eventMode.value = eventModel;
      eventMode.refresh();
    });
  }



  void _initDebitCreditSnapshot() {
    FirebaseFirestore.instance.collection('events').doc(eventMode.value.documentId).collection("debitCredit").snapshots().listen((QuerySnapshot<Map<String, dynamic>> event) {

      eventList.clear();
      _reset();

      for (var element in event.docs) {
        Map<String, dynamic> data = element.data();
        DebitCreditModel debitCreditModel = DebitCreditModel.fromJson(data);
        debitCreditModel.documentId = element.id;

        _onUpdateTotalCost(debitCreditModel);

        eventList.add(debitCreditModel);
      }

      eventList.refresh();
    });
  }

  void _onUpdateTotalCost(DebitCreditModel debitCreditModel){
    if(debitCreditModel.debitCreditType == "জমা"){
      totalCreditPrice.value += debitCreditModel.amount ?? 0;
    }else{
      totalDebitPrice.value += debitCreditModel.amount ?? 0;
    }
  }

  void _reset() {
    totalCreditPrice.value = 0;
    totalDebitPrice.value = 0;
  }



  @override
  void onSendRequestForMoneyPressed() {
    if( (eventMode.value.bookedUserInfo ?? []).where((element) => element.userId == appController.userModel.value.userId).isEmpty){
      Get.toNamed(Routes.USER_PACKAGE_DETAILS,arguments:{"event": eventMode.value});
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
      for(BookedUserInfo userInfo in eventMode.value.bookedUserInfo ?? []){
        if(userInfo.userId == appController.userModel.value.userId){
          bookedUserInfo = userInfo;
          break;
        }
      }
      if(bookedUserInfo != null){

        eventCollection.doc(eventMode.value.documentId).update({"bookedUserInfo":FieldValue.arrayRemove([bookedUserInfo.toJson()])}).onError((error, stackTrace){
          Get.snackbar("Failed", "$error");
          print('SendRequestViewController.onPopupAppBarIconClicked error : $stackTrace');
        });
        eventCollection.doc(eventMode.value.documentId).update({
          "totalBookedAdultCount": FieldValue.increment(-(bookedUserInfo.totalAdult ?? 0)),
          "totalBookedChildrenCount": FieldValue.increment(-(bookedUserInfo.totalChildren ?? 0)),
          "totalBookedUniqueCount": FieldValue.increment(-1),
        });

      }
    }
  }
}
