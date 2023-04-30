import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/controller/app_controller.dart';
import 'package:happy_family/app/common/values/my_colors.dart';
import 'package:happy_family/app/modules/admin/total_cost/all_users/models/debit_credit_model.dart';
import '../../../../../common/utils/utils.dart';
import '../interface/total_cost_interface.dart';

class AllUsersController extends GetxController implements TotalCostInterface {

  final formKey = GlobalKey<FormState>();
  final AppController appController = Get.find();

  Rx<TextEditingController> tecAmount = TextEditingController().obs;
  Rx<TextEditingController> tecCostingName = TextEditingController().obs;

  Rx<String> amountType = "জমা".obs;

  Rx<int> totalDebitPrice = 0.obs;
  Rx<int> totalCreditPrice = 0.obs;


  late String id;

  RxList<DebitCreditModel> eventList = <DebitCreditModel>[].obs;


  @override
  void onInit() {
    id = Get.arguments["id"];

    _initSnapshot();

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

  void _initSnapshot() {
    FirebaseFirestore.instance.collection('events').doc(id).collection("debitCredit").snapshots().listen((QuerySnapshot<Map<String, dynamic>> event) {

      eventList.clear();
      _reset();

      for (var element in event.docs) {
        Map<String, dynamic> data = element.data();
        DebitCreditModel debitCreditModel = DebitCreditModel.fromJson(data);
        debitCreditModel.documentId = element.id;

        _onUpdateTotalCost(debitCreditModel);

        eventList.add(debitCreditModel);
      }

      eventList.refresh();
    });
  }

  @override
  void onSubmitPressed() {
    Utils.unFocus;

    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      DebitCreditModel debitCreditModel = DebitCreditModel(
        amount: int.parse(tecAmount.value.text.trim()),
        costingName: tecCostingName.value.text.trim(),
        debitCreditType: amountType.value,
        addedBy: appController.userModel.value.userId,
      );
      CollectionReference debitCreditCollection = FirebaseFirestore.instance.collection('events').doc(id).collection("debitCredit");

      debitCreditCollection.add(debitCreditModel.toCreate()).then((DocumentReference<Object?> value){

        tecAmount.value.text = "";
        tecCostingName.value.text = "";

        Get.snackbar("Success", "All cost successfully added",backgroundColor: MyColors.greenColor);

      }).onError((error, stackTrace){
        Get.snackbar("Error", "$error");
        print('AllUsersController.onSubmitPressed error---<><>>> : $error');
        print('AllUsersController.onSubmitPressed error---<><> : $stackTrace');
      });
    }
  }

  @override
  void onCreditAndDebitChanged(String? value) {
    if(value != amountType.value){
      amountType.value = value!;
    }
  }


  void onDeleteTap(DebitCreditModel debitCreditModel) {
    FirebaseFirestore.instance.collection('events').doc(id).collection("debitCredit").doc(debitCreditModel.documentId).delete();
  }

  void _onUpdateTotalCost(DebitCreditModel debitCreditModel){
    if(debitCreditModel.debitCreditType == "জমা"){
      totalCreditPrice.value += debitCreditModel.amount ?? 0;
    }else{
      totalDebitPrice.value += debitCreditModel.amount ?? 0;
    }
  }

  void _reset() {
    totalCreditPrice.value = 0;
    totalDebitPrice.value = 0;
  }


}
