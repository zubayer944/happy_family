import 'package:get/get.dart';

import '../controllers/user_package_details_controller.dart';

class UserPackageDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserPackageDetailsController>(
      () => UserPackageDetailsController(),
    );
  }
}
