import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/controller/app_controller.dart';
import 'package:happy_family/app/common/widgets/custom_loader.dart';
import 'package:happy_family/app/modules/auth/registration/interface/registration_interface.dart';

import '../../../../common/local_storage/storage_helper.dart';
import '../../../../model/user_model.dart';
import '../../../../routes/app_pages.dart';

class RegistrationController extends GetxController implements RegistrationInterface {
  final formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Rx<UserModel> userModelInfo = UserModel().obs;

  final AppController appController = Get.find();

  Rx<TextEditingController> tecNameReg = TextEditingController().obs;
  Rx<TextEditingController> tecPhoneReg = TextEditingController().obs;
  Rx<TextEditingController> tecPasswordReg = TextEditingController().obs;

  @override
  void onInit() {
    // _registerUser();
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
  
  Future<void> _registerUser() async {
    UserModel userModel = UserModel(
      name: tecNameReg.value.text.trim(),
      phoneNumber: tecPhoneReg.value.text.trim(),
      password: tecPasswordReg.value.text.trim(),
      active: true,
      isOnline: true,
      role: "User",
      // createdAt: FieldValue.serverTimestamp(),
    );
    CustomLoader.show;
   await FirebaseFirestore.instance
        .collection('users')
        .where('phoneNumber', isEqualTo: tecPhoneReg.value.text.trim())
        .get().then((value) async {
          if(value.docs.isEmpty){
            await users.add(userModel.toJson()..remove('userId')..addAll({"createdAt": FieldValue.serverTimestamp(),})).then((DocumentReference<Object?> value) {
              CustomLoader.hide;
              appController.startUserSnapshot(value.id);
              StorageHelper.setUserPhone(tecPhoneReg.value.text.trim());
              StorageHelper.setUserPassword(tecPasswordReg.value.text.trim());
              Get.toNamed(Routes.USER_DASHBOARD);
            }).catchError((error,){
              CustomLoader.hide;
              print('RegistrationController._registerUser ----<><><> $error');
            });
          }else {
            CustomLoader.hide;
            Get.snackbar("Error", "Phone number already exist");
          }
    });


  }

  @override
  void onSubmitBtnPressed() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();

      _registerUser();
    }
  }



}
