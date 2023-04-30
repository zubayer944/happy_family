import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';

class AppController extends GetxController {



  Rx<UserModel> userModel = UserModel().obs;
   late String fcmTokenId;


  void startUserSnapshot(String docId) {
    var documentStream = FirebaseFirestore.instance.collection('users').doc(docId).snapshots().listen((DocumentSnapshot<Map<String, dynamic>> event) {
      userModel.value = UserModel.fromJson(event.data()!);
      userModel.value.userId = docId;
      userModel.refresh();

    });
  }

  @override
  void onInit() async{

     fcmTokenId = (await FirebaseMessaging.instance.getToken()) ?? "";

    super.onInit();
  }

}