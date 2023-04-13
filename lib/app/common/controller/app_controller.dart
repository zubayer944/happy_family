import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';

class AppController extends GetxController {

  Rx<UserModel> userModel = UserModel().obs;


  void startUserSnapshot(String docId) {
    var documentStream = FirebaseFirestore.instance.collection('users').doc(docId).snapshots().listen((DocumentSnapshot<Map<String, dynamic>> event) {
      userModel.value = UserModel.fromJson(event.data()!);
      userModel.value.userId = docId;
      userModel.refresh();

    });
  }

}