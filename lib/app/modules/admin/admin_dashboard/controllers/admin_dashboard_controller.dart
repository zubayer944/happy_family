import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/controller/app_controller.dart';
import 'package:happy_family/app/common/local_storage/storage_helper.dart';
import 'package:happy_family/app/modules/admin/admin_dashboard/interface/AdminDashboardInterface.dart';

import '../../../../routes/app_pages.dart';

class AdminDashboardController extends GetxController implements AdminDashboardInterface {
final AppController appController = Get.find();

  @override
  void onInit() {
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
  void onEventPressed() {
    Get.toNamed(Routes.ALL_EVENTS);
  }

  @override
  void onPopupAppBarIconClicked(String result) {
    if(result == "logout"){
      FirebaseFirestore.instance.collection('users').doc(appController.userModel.value.userId).update({
        'isOnline' : false,
        'pushToken' : "",
      });
      Get.offAndToNamed(Routes.LOGIN);
      StorageHelper.logout();
    }
  }

  @override
  void onUsersPressed() {
    // Get.toNamed(Routes.TOTAL_COST);
  }

  @override
  void onUsersPaymentPressed() {
   Get.toNamed(Routes.PAYMENT_CONFIRMATION);
  }

}
