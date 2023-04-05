import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../interface/user_package_details_interface.dart';

class UserPackageDetailsController extends GetxController implements UserPackageDetailsInterface {

  final formKey = GlobalKey<FormState>();

  Rx<TextEditingController> tecNameMem = TextEditingController().obs;
  Rx<TextEditingController> tecTotalMem = TextEditingController().obs;
  Rx<TextEditingController> tecTotalAdult = TextEditingController().obs;
  Rx<TextEditingController> tecTotalUnderAge = TextEditingController().obs;
  Rx<TextEditingController> tecBkashNo = TextEditingController().obs;
  Rx<TextEditingController> tecTransactionIdNo = TextEditingController().obs;
  Rx<TextEditingController> tecBankAccNo = TextEditingController().obs;

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
  void onSubmitPackageDetailsPressed() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      Get.back();
    }
    // TODO: implement onSubmitPackageDetailsPressed
  }

}
