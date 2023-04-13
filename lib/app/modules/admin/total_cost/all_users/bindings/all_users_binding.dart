import 'package:get/get.dart';

import '../controllers/total_cost_controller.dart';

class TotalCostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllUsersController>(
      () => AllUsersController(),
    );
  }
}
