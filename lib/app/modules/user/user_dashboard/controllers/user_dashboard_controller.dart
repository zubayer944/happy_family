import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/controller/app_controller.dart';
import 'package:happy_family/app/common/local_storage/storage_helper.dart';
import 'package:happy_family/app/common/utils/utils.dart';
import 'package:happy_family/app/model/event_model.dart';
import '../../../../routes/app_pages.dart';
import '../interface/user_dashboard_interface.dart';

class UserDashboardController extends GetxController implements UserDashBoardInterface {

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
  void onPackageClicked(EventModel event) {
    Utils.unFocus;
    // Get.toNamed(Routes.USER_PACKAGE_DETAILS,arguments:{"event": event});
    Get.toNamed(Routes.SEND_REQUEST_VIEW,arguments:{"event": event});



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

  BookedUserInfo? paymentStatus(EventModel event) {
    var temp =  (event.bookedUserInfo ?? []).where((element) => element.userId == appController.userModel.value.userId);
    if(temp.isEmpty){
      return null;
    }
    return temp.first;
  }
}
