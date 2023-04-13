import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../interface/all_events_interface.dart';

class AllEventsController extends GetxController implements AllEventsInterface {

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
  void onCreateEventPressed() {
    Get.toNamed(Routes.EVENT_CREATE);
  }

  @override
  void onEventClicked(String id) {
    Get.toNamed(Routes.EVENT_DETAILS,arguments: {"id":id});
    // TODO: implement onEventClicked
  }
}
