import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../interface/user_dashboard_interface.dart';

class UserDashboardController extends GetxController implements UserDashBoardInterface {
  //TODO: Implement UserDashboardController

  final count = 0.obs;
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
  void onPackageClicked() {
    Get.toNamed(Routes.USER_PACKAGE_DETAILS);
  }
}
