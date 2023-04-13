import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('users1');


}