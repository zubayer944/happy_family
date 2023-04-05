import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/modules/auth/login/interface/interface.dart';
import 'package:happy_family/app/routes/app_pages.dart';

class LoginController extends GetxController implements LoginInterface {
  final formKey = GlobalKey<FormState>();


  Rx<TextEditingController> tecPhone = TextEditingController().obs;
  Rx<TextEditingController> tecPassword = TextEditingController().obs;

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
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();



    }
  }


  @override
  Future<void> onRegistrationButtonPressed() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
print("Return something");
    // Get.toNamed(Routes.REGISTRATION);
 try{

   FirebaseFirestore.instance
       .collection('users')
       .doc("0Y3s5k48GVtHsBjE6lOe")
       .get()
       .then((DocumentSnapshot documentSnapshot) {
     if (documentSnapshot.exists) {
       print('Document data: ${documentSnapshot.data()}');
     } else {
       print('Document does not exist on the database');
     }
   });
 }catch (e,s) {
   print(s);
   print(e);
 }

  }
}
