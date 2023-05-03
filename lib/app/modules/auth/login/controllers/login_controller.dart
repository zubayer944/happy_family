import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/model/user_model.dart';
import 'package:happy_family/app/modules/auth/login/interface/interface.dart';
import 'package:happy_family/app/routes/app_pages.dart';
import '../../../../common/controller/app_controller.dart';
import '../../../../common/local_storage/storage_helper.dart';
import '../../../../common/values/my_colors.dart';
import '../../../../common/widgets/custom_loader.dart';

class LoginController extends GetxController implements LoginInterface {
  final formKey = GlobalKey<FormState>();


  Rx<TextEditingController> tecPhone = TextEditingController().obs;
  Rx<TextEditingController> tecPassword = TextEditingController().obs;

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
  void onLoginButtonPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();


      _userExistOrNot();

    }
  }

  Future<void> _userExistOrNot() async{
    CustomLoader.show;
    await FirebaseFirestore.instance
        .collection('users')
        .where('phoneNumber', isEqualTo: tecPhone.value.text.trim())
        .where('password', isEqualTo: tecPassword.value.text.trim())
        .get().then((QuerySnapshot<Map<String, dynamic>> value) {
      CustomLoader.hide;
      if(value.docs.isNotEmpty){
        appController.startUserSnapshot(value.docs.first.id);
        UserModel userModel = UserModel.fromJson(value.docs.first.data());
        StorageHelper.setUserPhone(tecPhone.value.text.trim());
        StorageHelper.setUserPassword(tecPassword.value.text.trim());
        StorageHelper.setUserRole(userModel.role);
        FirebaseFirestore.instance.collection('users').doc(value.docs.first.id).update({
          'isOnline' : true,
          'pushToken' : appController.fcmTokenId,
        });
        if(userModel.role == "User"){
          // print('LoginController._userExistOrNot ');
          Get.offAllNamed(Routes.USER_DASHBOARD);
        }else{
          Get.offAllNamed(Routes.ADMIN_DASHBOARD);
        }
        ///TODO select admin role here01
      }else{
        Get.snackbar("Something went wrong", "Sorry!! Phone or password is not correct",colorText: MyColors.redColor,backgroundColor:MyColors.redColor.withOpacity(0.3));
      }
    }).onError((onError,s){
      CustomLoader.hide;
      print('LoginController.onLoginButtonPressed $onError');
      print('LoginController.onLoginButtonPressed $s');
      Get.snackbar("Something went wrong", "Sorry!! Please try again",backgroundColor: MyColors.redColor.withOpacity(0.3));
    });
  }


  @override
  Future<void> onRegistrationButtonPressed() async {
    Get.toNamed(Routes.REGISTRATION);
  }
}
