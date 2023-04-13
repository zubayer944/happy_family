import 'package:get/get.dart';

import '../controllers/send_request_view_controller.dart';

class SendRequestViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendRequestViewController>(
      () => SendRequestViewController(),
    );
  }
}
