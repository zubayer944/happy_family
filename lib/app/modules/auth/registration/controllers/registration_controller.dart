import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/modules/auth/registration/interface/registration_interface.dart';

import '../../../../routes/app_pages.dart';

class RegistrationController extends GetxController implements RegistrationInterface {
  final formKey = GlobalKey<FormState>();


  Rx<TextEditingController> tecNameReg = TextEditingController().obs;
  Rx<TextEditingController> tecPhoneReg = TextEditingController().obs;
  Rx<TextEditingController> tecPasswordReg = TextEditingController().obs;

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
  void onSubmitBtnPressed() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();

      Get.toNamed(Routes.USER_DASHBOARD);


    }
  }



}
